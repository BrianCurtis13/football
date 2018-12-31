require 'faker'
require 'sequel'
require 'sqlite3'
require 'pry'

class Player

	attr_accessor :first_name, :last_name, :weight, :height, :speed, :quickness, :accuracy, :awareness, :strength, :power
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
		@weight = rand(170...390)
	end

	def get_height
		@height = rand(66...81)
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
		if @quickness > 100
			@quickness = 100
		end
		return @quickness
	end

	def get_accuracy
		@accuracy = rand(10..100) 
	end

	def get_awareness
		@awareness = rand(10..100)
	end

	def get_strength
		@strength = rand(10..100)
		case @weight 
			when 0...190
				@strength = (@strength * 0.8).round.to_i
			when 226...250
				@strength = (@strength * 1.2).round.to_i
			when 251...324 
				@strength = (@strength * 1.4).round.to_i
			when 325...400
				@strength = (@strength * 1.6).round.to_i
			else
				@strength
		end
		if @strength > 100
			@strength = 100
		end
		return @strength
	end

	def get_power
		@power = (@strength * @weight * @speed)/100
	end

	def get_overall
		@overall = (@accuracy + @speed + @quickness + @awareness)/4
	end

	def write_attributes(player, dataset)
		dataset.insert(first_name: player.first_name, last_name: player.last_name, weight: player.weight, height: player.height,
			speed: player.speed, quickness: player.quickness, accuracy: player.accuracy, awareness: player.awareness, overall: player.overall,
			strength: player.strength, power: player.power)
	end

# String :first_name
# 	  String :last_name
# 	  Integer :weight
# 	  Integer :height
# 	  Integer :speed
# 	  Integer :quickness
# 	  Integer :accuracy
# 	  Integer :awareness
# 	  Integer :overall
# 	  Integer :strength
# 	  Integer :power

end

def create_players(number,dataset)
	players_added = 0
	number.times do 
	player = Player.new
		if player.overall > 56
			player.write_attributes(player,dataset)
			players_added += 1
		end
	end
	puts "#{number} prospects showed up at evaluation day. #{players_added} were invited to the draft."
end

Pry.start

# binding.pry
# puts ''