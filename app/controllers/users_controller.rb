class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = ["Account sucessfully created"]
      log_in_user!(@user)
      redirect_to groups_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params
      .require(:user)
      .permit(:username, :password, :profile, :url, :img_url)
  end
end
