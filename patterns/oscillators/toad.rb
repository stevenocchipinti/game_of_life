require "./game_of_life"
require "./animator"

# Period = 2

game = GameOfLife.new [
         [1,1], [1,2], [1,3],
  [2,0], [2,1], [2,2]
]

Animator.new(game).animate
