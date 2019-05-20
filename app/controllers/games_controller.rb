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

    if result['found'] == false
      return @score = 1
    end

    @generate_letters = @payload.split("")

    @result.chars.each do |char|
      # raise
      if @generate_letters.include?(char) == false
        return @score = 2
      end
      return @score = 3

    end

  end
end
