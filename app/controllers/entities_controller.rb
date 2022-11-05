class EntitiesController < ApplicationController
  def index
    @title = 'TRANSACTIONS'
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
    @amount = @entities.sum(:amount)
  end

  def new
    @title = 'ADD TRANSACTION'
    if Group.where(user: current_user).ids.empty?
      redirect_to(
        new_group_path,
        notice: 'Please create a category first'
      ) and return
    end

    @entity = Entity.new
    group_id = params[:group_id]
    render(:new, locals: { group_id:, my_groups: helpers.check_groups(group_id) })
  end

  def create
    c_ids = params.require(:entity).fetch(:group_ids, [])[1..]
    c_ids << params[:group_id]

    @entity = Entity.new(create_params)

    if @entity.save
      @entity.groups.push(*Group.where(id: c_ids))
      redirect_to(
        group_entities_path(params[:group_id]), notice: 'Transaction created successfully!'
      )
    else
      error_render(@entity.errors.objects.first.full_message)
    end
  end

  private

  def create_params
    params
      .require(:entity)
      .permit(:name, :amount)
      .merge(user: current_user)
  end

  def transaction_params
    params.permit(:group_id).merge(entity: @entity)
  end
end
