class ListingsController < ApplicationController

  def new
    @listing = Listing.new
    @organizations = Organization.all

    if params[:organization_id]
      @listing.organization_id = params[:organization_id]
    end
  end


  def create
    @listing = current_user.created_listings.new(listing_params)
    if @listing.save
      flash[:success] = ["Successfully added #{@listing.name} for #{@listing.organization.name}"]
      redirect_to listing_url(@listing)
    else
      @organizations = Organization.all
      flash.now[:danger] = @listing.errors.full_messages
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private
  def listing_params
    params.require(:listing).permit(:organization_id, :name, :description, :url)
  end
end
