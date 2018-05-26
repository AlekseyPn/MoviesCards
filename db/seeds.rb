# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

SITE_URL = 'http://www.imdb.com/chart/top'

def get_movie_details(link)
  movie_url = get_movie_url link
  movie_page = get_page movie_url
  title = movie_page.at_css('h1').children.first.text
  year = movie_page.at_css('#titleYear a').text
  director = movie_page.at_css('[itemprop="director"]').text.strip
  { title: title, year: year, director: director }
end

def get_movie_url(movie)
  href_value = movie.at_css('.titleColumn a')['href']
  short_url "http://www.imdb.com/#{href_value}"
end

def short_url(url)
  url.split('/?').inject { |left, right| "#{left}/?#{right.split('&').last}" }
end

def get_page(url)
  Nokogiri::HTML(open(url))
end

def rating_links(page)
  page.css('.lister-list tr')
end

movies_for_seed = rating_links(get_page(SITE_URL))
                  .first(5)
                  .map { |link| get_movie_details link }

Movie.create(movies_for_seed)
