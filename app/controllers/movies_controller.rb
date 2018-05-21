# frozen_string_literal: true

# class for work with movies collection
class MoviesController < ApplicationController
  before_action :set_movie, only: %i(show edit update destroy)
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render "new"
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @movie.destroy
  end

  def new
    @movie = Movie.new
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :year, :director)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
