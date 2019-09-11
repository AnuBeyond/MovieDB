module MoviesHelper

  def star_count(movie, count)
    movie.ratings.where(rating_value: count).count
  end

end
