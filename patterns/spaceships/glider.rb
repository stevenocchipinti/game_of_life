require "./game_of_life"
require "./animator"

game = GameOfLife.new [
                [0,2],
  [1,0],        [1,2],
         [2,1], [2,2],
]

Animator.new(game).animate(interval: 0.1, generations: 100)
