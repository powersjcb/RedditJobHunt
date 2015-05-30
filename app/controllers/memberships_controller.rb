class MembershipsController < ApplicationController



  def create
    @membership = current_user.memberships.new(membership_params)
    if @membership.save
      flash[:success] = ["You have joined #{@membership.group.name}"]
      redirect_to group_url(id: @membership.group_id)
    else
      flash[:danger] = @membership.errors.full_messages
      redirect_to :back
    end
  end


  def destroy
    @membership = current_user.memberships.find(membership_params)
    if @membership.destroy
      flash[:notice] = ["You have left the group #{@membership.group}"]
      redirect_to groups_url
    else
      # bad request response
      flash[:danger] = @membership.errors.full_messages
      redirect_to :back
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:group_id)
  end

end
