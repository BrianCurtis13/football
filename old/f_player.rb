
class Player
  attr_reader :name, :height, :weight, :dash, :bench, :intel, :run, :block
  def initialize(name)
    @name = name
    @height = rand(5.5...6.9).round(1)
    # @height = rand(66...82)
    @weight = rand(170...400)
    @dash = rand(3.9...6.0).round(2)
    @bench = rand(10...40)
    @intel = rand(1...11)
  end

  def introduce
    puts "The player's name is #{@name}. He is #{@height} feet tall and weighs #{@weight} pounds.
    He ran the 40 in #{@dash} seconds and bench pressed 225 lbs. #{@bench} times. His intelligence is #{@intel} out of 10.
    Would you like to train this player?"
  end

def train
  @run = (5-@dash)*@weight
  @block = @weight*@bench
end

# def select
#   x = gets.chomp
#   break if x == 'y'
# else
#   train
# end
# end

end

puts "Welcome to the draft. Use name end to quit."

name = 'start'

while name != 'end'
puts "What is the player's name?"
name = gets.chomp

p = Player.new(name)

p.introduce

# p.select


p.train


# puts p.instance_variable_get(:@bench)

puts p.run
puts p.block


end

# puts "The player's name is #{name}."
