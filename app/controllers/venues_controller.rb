class VenuesController < ApplicationController

  respond_to :json

  def index
    @venues = Venue.all
    respond_to do |format|
      format.json { render json: { venues: @venues } }
      format.html {  }
    end
  end

  def show
    @band = Band.first
    @venue = Venue.includes(:shows).find(params[:id])

    respond_to do |format|
      format.json { render json: { venue: @venue} }
      format.html {  }
    end
  end

end


