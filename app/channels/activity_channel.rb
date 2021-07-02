class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
  end

  def unsubscribed
    online_status = OnlineStatus.find_by(user_id: current_user.id)

    if online_status.nil?
      online_status = OnlineStatus.create(
        user_id: current_user.id, 
        status: "offline"
      )
    else
      online_status.status = "offline"
      online_status.save
    end

    ActionCable.server.broadcast("activity_channel", {user_id: current_user.id, status: "offline"})
  end

  def appear
    online_status = OnlineStatus.find_by(user_id: current_user.id)

    if online_status.nil?
      online_status = OnlineStatus.create(
        user_id: current_user.id, 
        status: "online"
      )
    else
      online_status.status = "online"
      online_status.save
    end

    ActionCable.server.broadcast("activity_channel", {user_id: current_user.id, status: "online"})
  end
end
