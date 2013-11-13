require "./game_of_life"
require "./animator"

# Period = 2

game = GameOfLife.new [
  [1,0], [1,1], [1,2]
]

Animator.new(game).animate
