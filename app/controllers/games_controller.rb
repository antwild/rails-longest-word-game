require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('a'..'z').to_a[rand(0..25)] }
  end

  def score
    true_words
    grid = params[:letters]
    player = params[:player]
    @points = player.length

    if (player.split(//) - grid.split).empty? == false
      @message = "Sorry, '#{player}' can't be made from #{grid}"
    elsif @words['found'] == false
      @message = "Sorry, but '#{player}' is not a valid English word..."
    elsif (player.split(//) - grid.split).empty? && @words['found'] == true
      @message = "Well done, '#{player}' is a great word!"
    end

  end

  private

  def true_words
    url = "https://wagon-dictionary.herokuapp.com/#{params[:player]}"
    @words = JSON.parse(open(url).read)
  end


end
