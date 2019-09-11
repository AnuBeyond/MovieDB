module RatingsHelper

  def not_rated(movie_id)
    if current_user.present? && !Rating.find_by(movie_id: movie_id, user_id: current_user.id)
      true
    else
      false
    end
  end

end
