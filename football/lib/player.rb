require 'faker'

class Player

POSITIONS = {
  "Quarterback" => { :number => 1..19, :height_range => 70..78, :weight_range => 180..250 },
  "Running Back" => { :number => 20..49, :height_range => 65..77, :weight_range => 180..260 },
  "Tight End" => { :number => 80..89, :height_range => 72..79, :weight_range => 210..280 },
  "Offensive Tackle" => { :number => 60..79, :height_range => 76..82, :weight_range => 300..450 },
  "Offensive Guard" => { :number => 60..79, :height_range => 74..80, :weight_range => 300..450 },
  "Center" => { :number => 50..69, :height_range => 74..80, :weight_range => 300..450 },
  "Wide Receiver" => { :number => 10..19, :height_range => 68..77, :weight_range => 170..225 }
}

  attr_reader :first_name, :last_name, :height, :weight
  attr_accessor :position, :number

  def initialize(first_name = nil, last_name = nil, number = nil)
    @first_name = first_name || Faker::Name.male_first_name
    @last_name = last_name || Faker::Name.last_name
    @position = select_position
    @number = number || generate_value(:number)
    @height = generate_value(:height_range)
    @weight = generate_value(:weight_range)
    @rating = rand(1..10)
    # binding.pry
  end

  def select_position
    POSITIONS.keys.sample
  end

  def generate_value(attribute)
    rand(POSITIONS[@position][attribute]).to_s
  end

  def basic_attributes
    {
      :first_name => @first_name,
      :last_name => @last_name,
      :height => @height,
      :weight => @weight,
      :number => @number,
      :position => @position,
      :rating => @rating
    }
  end

  def greet
    puts "Hello, my name is #{@first_name} #{@last_name}."
    puts "My number is #{@number} and I play #{@position}."
    puts "I am #{@height} inches, #{@weight} lbs."
    puts "My rating is #{@rating}."
  end
end

