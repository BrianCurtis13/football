
class Player
  def initialize(name)
    @name = name
    @height = rand(5.5...6.9).round(1)
    # @height = rand(66...82)
    @weight = rand(170...400)
    @dash = rand(3.9...6.0).round(2)
    @bench = rand(10...40)
  end

  def introduce
    puts "The player's name is #{@name}. He is #{@height} feet tall and weighs #{@weight} pounds.
    He ran the 40 in #{@dash} seconds and bench pressed 225 lbs. #{@bench} times."
  end

end

puts "Welcome to the draft. Use name end to quit."

name = 'start'

while name != 'end'
puts "What is the player's name?"
name = gets.chomp

p = Player.new(name)

p.introduce

end

# puts "The player's name is #{name}."
