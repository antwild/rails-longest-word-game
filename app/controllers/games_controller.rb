class GamesController < ApplicationController

  def new
    alphabet = ('a'..'z').to_a
    @letters = 10.times.map { (alphabet[rand(0..25)]) }

  end

  def score
    sorted_grid = params[:letters].split
    sorted_player_word = params[:player].split(//)
      if (sorted_player_word - sorted_grid).empty?
        @message = "Well done"

      end
    # raise
  end
end
