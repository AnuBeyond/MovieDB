class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    if @rating.save
      @movie = Movie.find(@rating.movie_id)
    else
      redirect_to movies_path, notice: 'rating not added'
    end
  end

  private
  def rating_params
    params.permit(:movie_id, :user_id, :rating_value)
  end
end
