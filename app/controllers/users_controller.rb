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

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:success] = ["Successfully updated account info"]
      redirect_to user_url(@user)
    else
      flash[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.includes(:votes, :listing_votes).find(params[:id])
    @listings = @user.created_listings
    @listing_karma = @user.listing_votes.size
  end

  def set_activate_group
    @group = Group.find(params[:id])
    @user = current_user
    @user.active_group = @group

    if @user.save
      flash[:notice] = ["#{@group.name} is now your active group"]
      redirect_to @group
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to :back
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:username, :password, :password_confirmation,
              :profile, :url, :img_url)
  end
end
