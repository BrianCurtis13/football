class Pass
  def initialize()
    @type = 'none'
    @suc = 0
    @yards = 0
    @complete = false
  end

  def complete(type, suc)
    case type
    when 'short'
      case suc
      when (1...5)
        @complete = false
      when (6...20)
        @complete = true
      end
    when 'long'
      case suc
      when (1...9)
        @complete = false
      when (11...20)
        @complete = true
      end
    else
      @complete = 'no_play'
    end

def yards
  if @complete == true
    @yards = rand(1...20)
  else @yards = 0
  end
end

def announce
  if @complete == 'no_play'
    puts "Confusion at the line and they'll have to call a timeout."
  else puts "He drops back to throw ..."
    if @complete == true
      puts "and the pass is complete for #{@yards} yards!"
    else
      puts "and it falls incomplete."
    end
  end
end

end

class Run
  def initialize()
    @type = 'none'
    @suc = 0
    @yards = 0
    @outcome = false
  end

  def outcome(type, suc)
    case type
    when 'dive'
      case suc
      when (1...5)
        @outcome = false
      when (6...20)
        @outcome = true
      end
    when 'sweep'
      case suc
      when (1...9)
        @outcome = false
      when (11...20)
        @outcome = false
      end
    else
      @outcome = 'no_play'
    end


  def yards
    if @outcome == true
      @yards = rand(2...12)
    else @yards = rand(-3...0)
    end
  end

  def announce
    if @outcome == 'no_play'
    puts "Confusion at the line and they'll have to call a timeout."
    else puts "It's a handoff to the running back ..."
    end
    if @outcome == true
      puts "and he rumbles ahead for #{@yards} yards!"
    else
      puts "and he's stuffed for #{@yards} yards."
    end
  end
end

puts "What's the play coach?"
puts "1 = Run, 2 = Pass"

p_c = gets.chomp.to_i

def run_play(play_call)
  suc = rand(1...20)
if play_call == 1
  r = Run.new()
  r.outcome('dive',suc)
  r.yards
  r.announce
elsif play_call == 2
  p = Pass.new()
  p.complete('short',suc)
  p.yards
  p.announce
else
  n = Pass.new()
  n.complete('no_play',suc)
  n.announce
end
end



run_play(p_c)


# class Play
#   def initialize()
# end
# def run_play
#   suc = rand(1...20)
#   r = Run.new()
#   @run = r.outcome('dive',suc)
#   @yds = r.yards
#   @annc = r.announce
#   puts "#{@annc}"
# end
#
# def pass_play
#   suc = rand(1...20)
#   p = Pass.new()
#   @pass = p.complete('short',suc)
#   @yds = p.yards
#   @annc = p.announce
#   puts "#{@annc}"
# end
#
# pass_play()
#
# run_play()

# p.complete('short',suc)
#
# p.yards
#
# p.announce

# puts "The id of p is #{p.object_id}."

end
end
