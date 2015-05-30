class GroupsController < ApplicationController

  def index
    @groups = Group.includes(:memberships).all.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.includes(:organizations, :listings).find(params[:id])
    @organizations = @group.organizations
    @listings = @group.listings
  end

  def members
    @group = Group.find(params[:id])
    @users = @group.members
  end

  def create
    @group = current_user.created_groups.new(group_params)
    if @group.save
      flash[:success] = ["#{@group.name} successfully created!"]
      redirect_to group_url(@group)
    else
      flash.now[:danger] = @group.errors.full_messages
      render :new
    end
  end

  def destroy

  end


  private

  def group_params
    params.require(:group).permit(:name, :description, :url, :img_url)
  end
end
