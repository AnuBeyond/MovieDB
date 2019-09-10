class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.where(user_id: current_user.id)
  end

  def show

  end

  def new
    @roots = Category.where(parent_id: nil).order(:name)
    @movie = Movie.new
  end

  def edit
    @roots = Category.where(parent_id: nil).order(:name)
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      redirect_to movies_path, notice: 'Movie was not created.'
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      redirect_to movies_path, notice: 'Movie was successfully destroyed.'
    else
      redirect_to movies_path, notice: 'Movie was not destroyed.'
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :text, :category_id, :user_id, :image)
  end
end
