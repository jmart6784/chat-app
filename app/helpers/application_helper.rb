module ApplicationHelper
  def user_avatar(user, size=40, id = "", class_name="")
    if user.avatar.attached?
      image_tag(user.avatar.variant(resize: "#{size}x#{size}!"), id: id, class_name: class_name)
    else
      image_tag("default-profile.png", width: "#{size}", height: "#{size}", id: id, class_name: class_name)
    end
  end
end
