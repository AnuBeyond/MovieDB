class DashboardsController < ApplicationController

  def index
    @movies = Movie.all
    @categories = Category.all
    @movie_count = Movie.all.count
  end
end
