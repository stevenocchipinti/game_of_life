require "./game_of_life"

class Animator
  attr_accessor :game_of_life

  KILL_LINE_CHAR = "\x1B[K"
  CURSOR_UP_CHAR = "\x1B[A"

  def initialize(game_of_life)
    @game = game_of_life
  end

  def animate(generations=10)
    dump
    generations.times do
      clear
      dump
      sleep 1
      @game.iterate
    end
  end

  private

  def dump
    print "  +-"
    @game.grid.first.size.times { print "--" }
    puts "+"
    @game.grid.each do |row|
      print "  | "
      row.each { |cell| print cell ? "* " : "  " }
      puts "|"
    end
    print "  +-"
    @game.grid.first.size.times { print "--" }
    puts "+"
  end

  def clear
    lines = @game.grid.size + 2
    lines.times { print "#{CURSOR_UP_CHAR}#{KILL_LINE_CHAR}" }
  end


end
