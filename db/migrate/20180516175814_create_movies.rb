# frozen_string_literal: true

# migration for movie
class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :url
      t.string :image_name

      t.timestamps
    end
  end
end
