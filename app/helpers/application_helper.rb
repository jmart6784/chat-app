module ApplicationHelper
  def friend_list(user)
    user.friend_as + user.friend_bs
  end
end
