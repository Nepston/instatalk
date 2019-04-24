module ApplicationHelper
  def user_online
    User.online.pluck(:nickname).join(', ')
  end
end
