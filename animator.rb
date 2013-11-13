require "./game_of_life"

class Animator
  attr_accessor :game_of_life

  KILL_LINE_CHAR = "\x1B[K"
  CURSOR_UP_CHAR = "\x1B[A"

  def initialize(game_of_life)
    @game = game_of_life
  end

  def animate(options={})
    @border = options[:border] || false
    generations = options[:generations] || 10
    interval = options[:interval] || 1

    generations.times do
      dump
      sleep interval
      clear
      @game.iterate
    end
    dump
  end


  private

  def dump
    puts "  +-#{"--" * width}+" if @border
    height.times do |row|
      print "  | " if @border
      width.times do |col|
        print @game.live_cells.include?([row, col]) ? "* " : "  "
      end
      puts @border ? "|" : ""
    end
    puts "  +-#{"--" * width}+" if @border
  end

  def clear
    lines = @border ? (height + 2) : height
    lines.times { print "#{CURSOR_UP_CHAR}#{KILL_LINE_CHAR}" }
  end

  def height
    @game.live_cells.collect(&:first).max + 1
  end

  def width
    @game.live_cells.collect(&:last).max + 1
  end

end
