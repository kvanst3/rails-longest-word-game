require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
  end

  def score
    @result = params[:result]
    @payload = params[:payload]
    url = "https://wagon-dictionary.herokuapp.com/#{@result}"
    check = open(url).read
    result = JSON.parse(check)

    return @score = "Sorry but #{@result} does not seem to be a valid English word..." if result['found'] == false

    @generate_letters = @payload.split("")

    @result.chars.each do |char|
      # raise
      if @generate_letters.include?(char) == false
        return @score = "Sorry but #{@result} has letters not part of the grid"
      end
      return @score = "Congratulations! #{@result} is a valid English word!"

    end

  end
end
