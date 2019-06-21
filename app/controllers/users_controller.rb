class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        Rails.logger.debug("PPP:::")
        @user = User.new(role_param)
        Rails.logger.debug("sadsafsaf #{role_param}" )
        # @user.role = Role.last
        if @user.save
            flash[:notice] = "User was successfully created"
            redirect_to user_path(@user)
        else
            render "new"
        end
    end

    private
        def role_param
            params.require(:user).permit(:user_name, :email, :role_id)
        end
end