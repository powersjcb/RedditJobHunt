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
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.includes(:votes, :listing_votes).find(params[:id])
    @listings = @user.created_listings
    @listing_karma = @user.listing_votes.size
  end


  private

  def user_params
    params
      .require(:user)
      .permit(:username, :password, :profile, :url, :img_url)
  end
end
