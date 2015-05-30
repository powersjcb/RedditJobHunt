class OrganizationsController < ApplicationController

  def new
    @groups = Group.all
    @organization = Organization.new

    if params[:group_id]
      @organization.group_id = params[:group_id]
    end
  end


  def create
    @organization = current_user.created_organizations.new(org_params)

    if @organization.save
      flash[:success] = ["#{@organization.name} successfully created"]
      redirect_to organization_url(@organization)
    else
      flash[:errors] = @organization.errors.full_messages
      render :new
    end
  end

  private

  def org_params
    params.require(:organization).permit(:group_id, :name, :description, :url)
  end
end
