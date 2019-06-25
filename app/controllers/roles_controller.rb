class RolesController < ApplicationController
  def new
    # @role = Role.new(name:params[:name])
    @role = Role.new()
  end

  def create
    @role = Role.new(role_param)
    if @role.save
      flash[:notice] = "Role was successfully created"
      redirect_to role_path(@role)
    else
      render "new"
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  private
    def role_param
      params.require(:role).permit(:name)
    end
end