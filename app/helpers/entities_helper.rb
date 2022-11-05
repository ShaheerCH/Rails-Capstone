module EntitiesHelper
  def check_groups(group_id)
    Group.where('user_id = ? AND id <> ?', current_user.id, group_id)
  end

  def format(entity)
    entity.created_at.strftime('%d-%m-%Y')
  end
end
