class SongsController < ApplicationController

  def index
    @songs = Song.order(:title).all
    respond_to do |format|
      format.json { render json: { songs: @songs } }
      format.html {  }
    end
  end

  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.json { render json: { song: @song } }
      format.html {  }
    end
  end
end
