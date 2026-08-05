class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show]

  def index
    @movie = Movie.includes(:screenings)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to admin_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to admin_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.expect(movie: [:name, :genre, :duration, :description, :start_date, :end_date])
  end
end
