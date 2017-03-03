class Pass
  def initialize()
    @type = 'none'
    @suc = 0
    @yards = 0
    @complete = false
  end

  def pass_short(suc)
    complete_short(suc)
    yards_short
  end

  def pass_long(suc)
    complete_long(suc)
    yards_long
  end

  def complete_short(suc)
    case suc
    when (1...5)
      @complete = false
    when (6...20)
      @complete = true
    end
  end

  def complete_long(suc)
    case suc
    when (1...9)
      @complete = false
    when (11...20)
      @complete = true
    end
  end

  def yards_short
    if @complete == true
      @yards = rand(1...20)
    else @yards = 0
    end
  end

  def yards_long
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
  end

  def yards
    if @outcome == true
      @yards = rand(2...12)
    else
      @yards = rand(-3...0)
    end
  end

  def announce
    if @outcome == 'no_play'
      puts "Confusion at the line and they'll have to call a timeout."
    else
      puts "It's a handoff to the running back ..."
    end
    if @outcome == true
      puts "and he rumbles ahead for #{@yards} yards!"
    else
      puts "and he's stuffed for #{@yards} yards."
    end
  end
end

puts "What's the play coach?"
puts "1 = Dive, 2 = Sweep, 3 = Short Pass, 4 = Long Pass"

p_c = gets.chomp.to_i

def dive
  suc = rand(1...20)
  r = Run.new()
  r.outcome('dive',suc)
  r.yards
  r.announce
end

def sweep
  suc = rand(1...20)
  r = Run.new()
  r.outcome('sweep',suc)
  r.yards
  r.announce
end

def short_pass
  suc = rand(1...20)
  p = Pass.new()
  p.pass_short(suc)
  p.yards_short
  p.announce
end

def long_pass
  suc = rand(1...20)
  p = Pass.new()
  p.pass_long(suc)
  p.yards_long
  p.announce
end

def run_the_play(play_call)
  case play_call
  when 1
    dive
  when 2
    sweep
  when 3
    short_pass
  when 4
    long_pass
  else
    puts "That's not in the playbook."
  end
end

run_the_play(p_c)
