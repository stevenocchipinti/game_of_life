require "./game_of_life"
require "./animator"

# Period = 2

game = GameOfLife.new [
  [0,0], [0,1],
  [1,0],
                       [2,3],
                [3,2], [3,3]
]

Animator.new(game).animate
