class OnlineChannel < ApplicationCable::Channel
  def subscribed
    current_user.update_attribute(:online, true)
    stream_from "online_channel"
    ActionCable.server.broadcast "online_channel", users: User.online.as_json
  end

  def unsubscribed
    current_user.update_attribute(:online, false)
    ActionCable.server.broadcast "online_channel", users: User.online.as_json
  end
end
