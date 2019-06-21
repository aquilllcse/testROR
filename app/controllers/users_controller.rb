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
            # redirect_to user_path(@user) TODO will uncomment once show page is avialable
            redirect_to new_user_role_path(role_param[:role_id])
        else
            flash[:notice] = @user.errors
            redirect_to new_user_role_path(role_param[:role_id])
        end
    end

    private
        def role_param
            params.require(:user).permit(:user_name, :email, :role_id)
        end
end