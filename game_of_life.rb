class GameOfLife

  attr_accessor :grid

  def initialize(grid)
    @grid = grid
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
    ].select { |r,c| coord_in_grid?(r, c) }
  end

  def alive_neighbours(row, col)
    neighbour_cells(row, col).select do |r,c|
      @grid[r][c]
    end.count
  end

  def iterate
    new_grid = []

    @grid.count.times do |row|
      new_grid << []
      @grid.first.count.times do |column|
        new_grid[row][column] = next_generation(row, column)
      end
    end

    @grid = new_grid
  end

  private

  def coord_in_grid?(row, col)
    row.between?(0, @grid.count-1) && col.between?(0, @grid.first.count-1)
  end

  # GAME OF LIFE RULES:
  # 1. Loneliness:      Alive cell with < 2 live neighbours dies
  # 2. Survival:        Alive cell with 2 or 3 live neighbours continues living
  # 3. Overcrowding:    Alive cell with > 3 live neighbours dies
  # 4. Reproduction:    Dead cell with 3 neighbours comes to life
  def next_generation(row, column)
    if @grid[row][column]
      alive_neighbours(row, column).between? 2, 3
    else
      alive_neighbours(row, column) == 3
    end
  end

end
