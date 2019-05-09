require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('a'..'z').to_a[rand(0..25)] }
  end

  def score
    true_words
    sorted_grid = params[:letters].split
    sorted_player_word = params[:player].split(//)

      if (sorted_player_word - sorted_grid).empty? == false
        @message = "Sorry, '#{params[:player]}' can't be made from #{params[:letters]}"
      elsif @words['found'] == false
        @message = "Sorry, but '#{params[:player]}' does not seem to be a valid English word..."
      elsif (sorted_player_word - sorted_grid).empty? && @words['found'] == true
        @message = "Well done, '#{params[:player]}' is a great word!"
      end

  end

  private

  def true_words
    url = "https://wagon-dictionary.herokuapp.com/#{params[:player]}"
    @words = JSON.parse(open(url).read)
  end
end
