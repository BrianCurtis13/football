require 'pry'
require_relative './lib/player'
require_relative './lib/football_db'

def play
    puts "Guess what I'm thinking about?"
    db = FootballDB.new('2021')
    prospect = Player.new
    prospect.greet
    binding.pry
    puts "I'm thinking about F O O O O O O T B A L L ..."
end

play