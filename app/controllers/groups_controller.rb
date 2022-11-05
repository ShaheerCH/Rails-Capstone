class GroupsController < ApplicationController
  def index
    @title = 'CATEGORIES'
    @groups = Group
      .select('groups.*, SUM(E.amount) as amount')
      .joins('LEFT JOIN categories as C ON C.group_id = groups.id')
      .joins('LEFT JOIN entities as E ON E.id = C.entity_id')
      .where(user_id: current_user.id)
      .group(:id)
  end

  def new
    @title = 'NEW CATEGORY'
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to(root_path, notice: 'Category created successfully')
    else
      render(:new, status: :unprocessable_entity, alert: @group.errors.objects.first.full_message)
    end
  end

  private

  def create_params
    params
      .require(:group)
      .permit(:name, :icon)
      .merge(user: current_user)
  end
end
