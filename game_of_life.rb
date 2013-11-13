class GameOfLife

  attr_accessor :live_cells

  def initialize(live_cells)
    @live_cells = live_cells
  end

  def neighbour_cells(row, col)
    [
      [row-1, col-1],
      [row-1, col],
      [row-1, col+1],
      [row,   col-1],
      [row,   col+1],
      [row+1, col-1],
      [row+1, col],
      [row+1, col+1]
    ].select { |r,c| r >= 0 && c >= 0 }
  end

  def live_neighbours(row, col)
    neighbour_cells(row, col).select do |r,c|
      @live_cells.include? [r,c]
    end.count
  end

  def iterate
    new_live_cells = []
    @live_cells.each do |live_cell|
      [live_cell] + neighbour_cells(live_cell[0], live_cell[1]).each do |cell|
        new_live_cells << cell if next_generation(cell[0], cell[1])
      end
    end
    @live_cells = new_live_cells.uniq.sort
  end

  private

  # GAME OF LIFE RULES:
  # 1. Loneliness:      Alive cell with < 2 live neighbours dies
  # 2. Survival:        Alive cell with 2 or 3 live neighbours continues living
  # 3. Overcrowding:    Alive cell with > 3 live neighbours dies
  # 4. Reproduction:    Dead cell with 3 neighbours comes to life
  def next_generation(row, column)
    if @live_cells.include? [row, column]
      live_neighbours(row, column).between? 2, 3
    else
      live_neighbours(row, column) == 3
    end
  end

end
