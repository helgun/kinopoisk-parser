require "nokogiri"
require 'open-uri'
require_relative "film"

films = []

films = Film.from_list
puts "Фильм какого режиссера будем смотреть?"
directors = films.map { |z| z.director }.uniq
directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

user_input = directors.count + 1
while user_input > directors.count
  user_input = gets.to_i
end
puts "Вы выбрали:"
film_selected = films.select{ |z| z.director == directors[user_input - 1] }.sample
puts film_selected
