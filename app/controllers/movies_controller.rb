# frozen_string_literal: true

# class for work with movies collection
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
end
