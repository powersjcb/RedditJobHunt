class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)
    @vote.save
    @listing = Listing.find(vote_params[:listing_id])
    @vote_count = @listing.votes.count

    respond_to do |format|
      format.html
      format.json { render json: :votes }
    end
  end

  def destroy
    @vote = current_user.votes.where(params[:id]).destroy
    @listing    = @vote.listing
    @vote_count = @listing.votes.count

    respond_to do |format|
      format.html
      format.json { render json: :votes }
    end
  end

  def vote_params
    params.require(:vote).permit(:listing_id)
  end
end
