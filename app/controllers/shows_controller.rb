class ShowsController < ApplicationController

  respond_to :json

  def index
    if params[:year]
      @shows = Show.by_year(params[:year].to_i)
    else
      @shows = Show.order("date desc").last(5)
    end
    respond_to do |format|
      format.json { render json: { shows: @shows } }
      format.html {  }
    end
  end

  def show
    @show = Show.joins(:venue).find(params[:id])

    respond_to do |format|
      format.json { render json: { show: @show} }
      format.html {  }
    end
  end

end

