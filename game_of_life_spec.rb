require './game_of_life'

describe GameOfLife do

  let(:grid) do
    [
      [false, false, false],
      [false, true,  false],
      [false, false, false]
    ]
  end
  let(:game) { GameOfLife.new grid }

  describe "#initialize" do
    it "stores its initial grid in the @grid instance variable" do
      game.instance_variable_get(:@grid).should == grid
      game.grid.should == grid
    end
  end

  describe "#neighbour_cells" do
    it "returns the coordinates of a given cells neighbours" do
      game.neighbour_cells(0,0).should == [[0,1], [1,0], [1,1]]
      game.neighbour_cells(0,1).should == [[0,0], [0,2], [1,0], [1,1], [1,2]]
      game.neighbour_cells(1,1).should == [
        [0,0], [0,1], [0,2],
        [1,0], [1,2],
        [2,0], [2,1], [2,2]
      ]
    end
  end

  describe "#alive_neighbours" do
    it "returns the number of alive neighbours the given cell has" do
      game.alive_neighbours(0,0).should == 1
      game.alive_neighbours(1,1).should == 0
      game.alive_neighbours(2,0).should == 1
    end
  end

  describe "#iterate" do
    let(:next_grid) do
      [
        [false, false, false],
        [false, false, false],
        [false, false, false]
      ]
    end

    it "mutates the @grid to represent the next generation" do
      game.iterate
      game.grid.should == next_grid
    end
  end

end
