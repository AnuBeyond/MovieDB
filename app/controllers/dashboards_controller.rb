class DashboardsController < ApplicationController

  def index
    @movies = Movie.all
    @categories = Category.all
  end
end
