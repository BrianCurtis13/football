# A football drive simulator.

def yard_line_convertor(y)
  if y <= 50
    yl = y
  else
    yl = 100-y
  end
  return yl
end

def play_outcome(x)
  # suc = 2
  p = 0
  suc = rand(1...20)
  puts "You rolled #{suc}."
  puts ""
  case x
  when "1"
    case suc
    when (0...4)
      p = rand(-5...-1)
    when (5...15)
      p = rand(0...11)
    when (16...20)
      p = rand(12...50)
    end
  when "2"
    case suc
    when (0...2)
      p = rand(-8...-1)
    when (3...7)
      p = 0
    when (8...16)
      p = rand(6...15)
    when (17...20)
      p = rand(16...75)
    end
  when "3"
    case suc
    when (0...4)
      p = rand(-15...-1)
    when (5...12)
      p = 0
    when (13...19)
      p = rand(10...40)
    when 20
      p = 100
    end
  else
    puts "That's not in the playbook!"
  end
  puts "Raw Play Score: #{p}"
  return p
end


#while distance > 0 and down < 5 do

yards = 0.0

# start_pos = rand(15...45)

start_pos = rand(5 ... 40)

ball_on = start_pos

yard_line = yard_line_convertor(ball_on)

down = 1

distance = 10

plays = 0

# def play_outcome(x)
#
#   case x
#   when "1"
#     p = rand(0...5)
#   when "2"
#     p = rand(-5...15)
#   when "3"
#     p = rand(-10...50)
#   else
#     puts "That's not in the playbook!"
#   end
# end




while yards < (100 - start_pos) do

  play = 0

  puts ""

  puts "Down: #{down}"

  puts "To go: #{distance}"

  puts "Ball on: #{yard_line}"

  puts "  "

  puts "What's the play, coach?"
  puts "1: Run"
  puts "2: Short Pass"
  puts "3: Long Pass"

  play_call = gets.chomp
  # puts play_call

  play = play_outcome(play_call)

    if play <= 0

      puts "Stopped for a loss of #{play} yards."

    elsif (play + yards) > (110 - yards)
      play = 110 - yards

      puts "That's a #{play} yard touchdown!"

    else

      puts "You gained #{play} yards."

    end

  yards = yards + play

  distance = distance - play

  down += 1

  plays += 1

  ball_on += play

  yard_line = yard_line_convertor(ball_on)

  ypp = yards/plays

  if distance <= 0 and yards < (99 - start_pos)
    puts "First down!"

    down = 1

    distance = 10
  end

  puts "Total yards: #{yards}"

  if down > 4
    puts "You turned it over on downs."
    break
  end

if yards > (99 - start_pos)
  puts "Touchdown!"
  puts "That was a #{plays} play scoring drive averaging #{ypp} yards per play."
end

end
