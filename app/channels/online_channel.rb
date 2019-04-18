class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    if current_user
      ActionCable.server.broadcast "online_channel", { user: current_user.nickname, online: :on }
      current_user.online = true
      current_user.save!
    end
  end

  def unsubscribed
    if current_user
      # Any cleanup needed when channel is unsubscribed
      ActionCable.server.broadcast "online_channel", { user: current_user.nickname, online: :off }
      current_user.online = false
      current_user.save!
    end
  end
end