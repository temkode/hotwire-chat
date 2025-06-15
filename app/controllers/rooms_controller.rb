class RoomsController < ApplicationController
  before_action :set_room, only: %i[show destroy]
  def index
    @rooms = Room.all
  end

  def show
    @messages = @room.messages.recent
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    begin
      if @room.save
        redirect_to rooms_path, notice: "Room created"
      else
        flash.now[:alert] = @room.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    rescue StandardError => e
      flash.now[:alert] = "Error creating room: #{e.full_message}"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, notice: "Successfully deleted room"
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
