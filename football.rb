#Dad and Kyle's football simulator.

#Next steps:

plays = 0
@yards = 0.0

until @yards >= 100 do

  down = 1

  distance = 10.0

  while distance > 0 do

  puts "Choose a risk level of 1, 2, or 3."

  play_call = gets.chomp

    if play_call == "1"

      play = rand(0...5).to_f

    elsif play_call == "2"

      play = rand(-5...15).to_f

    elsif play_call == "3"

      play = rand(-20...70).to_f

    else
      puts "That's not in the playbook!"
    end

  if play < 0

  puts "Stopped for a loss of #{play} yards."

  else

  puts "You gained #{play} yards."

  end

  @yards = @yards + play

  distance = distance - @yards

  down += 1

  plays += 1

  if distance <= 0.0
    down = 1
    distance = 10.0
  end

  if down > 4
    puts "You turned it over on downs."
  end
  end

#  ypp = (yards.to_f/plays.to_f)

  ypp = (@yards/plays)

  puts "You scored a touchdown."
  puts "#{@yards} total yards."

  puts "Play count: #{plays}"

  puts "#{ypp}"

end
