require './game_of_life'

describe GameOfLife do

  let(:live_cells) { [[1,1]] }
  let(:game) { GameOfLife.new live_cells }

  describe "#initialize" do
    it "stores its initial live cells in the @live_cells instance variable" do
      game.instance_variable_get(:@live_cells).should == live_cells
      game.live_cells.should == live_cells
    end
  end

  describe "#neighbour_cells" do
    it "returns the coordinates of a given cells neighbours" do
      game.neighbour_cells(0,0).should == [[0,1], [1,0], [1,1]]
      game.neighbour_cells(0,1).should == [[0,0], [0,2], [1,0], [1,1], [1,2]]
      game.neighbour_cells(1,1).should == [
        [0,0], [0,1], [0,2],
        [1,0],        [1,2],
        [2,0], [2,1], [2,2]
      ]
    end
  end

  describe "#live_neighbours" do
    it "returns the number of live neighbours the given cell has" do
      game.live_neighbours(0,0).should == 1
      game.live_neighbours(1,1).should == 0
      game.live_neighbours(2,0).should == 1
    end
  end

  describe "#iterate" do
    context "when a given live cell has < 2 live neighbours" do
      let(:live_cells) { [[1,1]] }

      it "dies" do
        game.iterate
        game.live_cells.should == []
      end
    end

    context "when a given live cell has 2 or 3 live neighbours" do
      let(:live_cells) { [[0,0], [0,1], [1,0], [1,1]] }

      it "continues living" do
        game.iterate
        game.live_cells.should == [[0,0], [0,1], [1,0], [1,1]]
      end
    end

    context "when a given live cell has > 3 live neighbours" do
      let(:live_cells) do
        [
          [0,0], [0,1],
          [1,0], [1,1],
                        [2,2], [2,3],
                        [3,2], [3,3],
        ]
      end

      it "dies" do
        next_gen_live_cells = [
          [0,0], [0,1],
          [1,0],
                               [2,3],
                        [3,2], [3,3],
        ]
        game.iterate
        game.live_cells.should == next_gen_live_cells
      end
    end

    context "when a given dead cell has 3 live neighbours" do
      let(:live_cells) do
        [
          [0,0], [0,1],
          [1,0],
                               [2,3],
                        [3,2], [3,3],
        ]
      end

      it "comes to life" do
        next_gen_live_cells = [
          [0,0], [0,1],
          [1,0], [1,1],
                        [2,2], [2,3],
                        [3,2], [3,3],
        ]

        game.iterate
        game.live_cells.should == next_gen_live_cells
      end
    end

  end

end
