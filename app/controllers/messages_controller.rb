class MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.build
  end

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to room_path(@room)
    else
      redirect_to room_path(@room), alert: "Error sending message"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end