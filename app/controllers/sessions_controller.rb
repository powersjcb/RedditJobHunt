class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      login_params[:username],
      login_params[:password])

    if @user
      log_in_user!(@user)
      flash[:success] = ["Logged in"]
      redirect_to groups_url
    else
      flash[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
