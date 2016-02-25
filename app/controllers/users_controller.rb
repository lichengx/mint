class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    # if @user.update_attributes(secure_params)
    #   redirect_to users_path, :notice => "User updated."
    # else
    #   redirect_to users_path, :alert => "Unable to update user."
    # end
    respond_to do |format|
      if @user.update_attributes(secure_params)
        format.html { render :edit, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to @user}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :avatar)
  end

end
