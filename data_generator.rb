require 'pry'
require 'faker'

def philosopher_says_hi
	name = Faker::GreekPhilosophers.name
	wisdom = Faker::GreekPhilosophers.quote
	sports = who_won_the_game
	puts "Greetings. My name is #{name}. Today's lesson is: #{wisdom} #{sports}"
end

def who_won_the_game
	team1 = Faker::WorldCup.team
	team2 = Faker::WorldCup.team
	win = rand(0..1).to_i
	win == 0 ? winner = team1 : winner = team2
	return "In the match between #{team1} and #{team2}, #{winner} won."
end

Pry.start