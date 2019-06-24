class ConferenceRoomsController < ApplicationController
    def new
        @room = ConferenceRoom.new
    end

    def create
        @room = ConferenceRoom.new(role_param)
        if @room.save
            UserMailer.with(conference_room: @room).confirmation.deliver
            flash[:notice] = "Room was booked Successfully"
            redirect_to conference_room_path(@room)
        else
            render "new"
        end
    end

    def show
        @room = ConferenceRoom.find(params[:id])
    end

    private
        def role_param
            params.require(:conference_room).permit(:room_number, :user_id)
        end
end