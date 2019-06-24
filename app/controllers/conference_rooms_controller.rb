class ConferenceRoomsController < ApplicationController
    
    before_action :find_room, only: [:update, :show, :destroy]

    def index
        @rooms = ConferenceRoom.all
    end
   
    def new
        @room = ConferenceRoom.new
    end

    def edit
        @room = ConferenceRoom.find_by(params[:user_id])
    end

    def update
        #@room = ConferenceRoom.find(params[:id])
        if @room.update(role_param) && auth(@room)
            UserMailer.with(conference_room: @room).updation.deliver
            flash[:notice] = "Room successfully edited"
            redirect_to conference_room_path(@room)
        else
            # render plain: "Only admin can edit or delete rooms"
            render "edit"
        end
    end

    def destroy
        #@room = ConferenceRoom.find(params[:id])
        if auth(@room)
            UserMailer.with(conference_room: @room).deletion.deliver
            @room.destroy
            redirect_to conference_rooms_path
        else
            render plain:"Only Admin can delete"
        end
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
        #@room = ConferenceRoom.find(params[:id])
    end

    private
        def find_room
            @room = ConferenceRoom.find(params[:id])
        end
        def role_param
            params.require(:conference_room).permit(:room_number, :user_id)
        end

        def auth(room)
            if(room.user.role.name.downcase == "ADMIN".downcase)
                return true
            else
                return false
            end
        end
end