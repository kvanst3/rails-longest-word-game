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

    return @score = 1 if result['found'] == false

    @result.chars.each do |char|
      return @score = 2 if @result.chars.count(char) > @payload.chars.count(char)
      return @score = 3
    end
  end
end

# Use this to count if number of letters is matching or less
# answer.chars.all? {|letter| answer.chars.count(letter) <= letters.char.count(letter)}
