require 'faker'
require 'sequel'
require 'sqlite3'
require 'pry'

class Player

	attr_accessor :first_name, :last_name, :weight, :height, :speed, :quickness, :accuracy, :awareness
	attr_reader :overall

	def initialize(first_name = nil, last_name = nil)
		@first_name = first_name || Faker::Name.male_first_name		
		@last_name = last_name || Faker::Name.last_name
		@weight = get_weight
		@height = get_height
		@speed = get_speed
		@quickness = get_quickness
		@accuracy = get_accuracy
		@awareness = get_awareness
		@overall = get_overall
		@strength = get_strength
		@power = get_power
	end		

	def get_first_name
		puts "Enter first name:"
		@first_name = gets.chomp
	end

	def get_last_name
		puts "Enter last name:"
		@last_name = gets.chomp
	end

	def get_weight
		@weight = rand(170...370)
	end

	def get_height
		@height = rand(66...80)
	end

	def get_speed
		@speed = rand(1..100)
		case @weight 
			when 226...250
				@speed = (@speed * 0.8).round.to_i
			when 251...324 
				@speed = (@speed * 0.6).round.to_i
			when 325...400
				@speed = (@speed * 0.4).round.to_i
			else
				@speed
		end
	end

	def get_quickness
		@quickness = rand(1..100)
		case @height
			when 0..69
				@quickness = (@quickness.to_f * 1.25).round.to_i
			when 76..100
				@quickness = (@quickness.to_f * 0.8).round.to_i
			else
				@quickness
		end
	end

	def get_accuracy
		@accuracy = rand(10..100) 
	end

	def get_awareness
		@awareness = rand(10..100)
	end

	def get_strength
		@strength = rand(10..100)
	end

	def get_power
		@power = (@strength * @weight)
	end

	def get_overall
		@overall = (@accuracy + @speed + @quickness + @awareness)/4
	end

	def height
		@height
	end

	def weight
		@weight
	end

	def speed
		@speed
	end

	def quickness
		@quickness	
	end

end

Pry.start

# binding.pry
# puts ''