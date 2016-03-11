class HomeController < ApplicationController
  def index
    @shows = Show.order("date desc").last(3)
  end
end
