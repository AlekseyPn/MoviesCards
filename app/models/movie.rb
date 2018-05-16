# frozen_string_literal: true

# movie database model
class Movie < ApplicationRecord
  validates :title, :year, :url, :image_name, presence: true
end
