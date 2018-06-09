# frozen_string_literal: true

# movie model
class Movie < ApplicationRecord
  validates :title, :year, :revision_date, :director, presence: true
  validates :year, numericality: { only_integer: true }
  validates :title, :director, length: { minimum: 2 }
  before_validation :set_revision_date, on: %i[create update]

  private

  def set_revision_date
    self.revision_date = Time.zone.today.strftime('%d %B')
  end
end
