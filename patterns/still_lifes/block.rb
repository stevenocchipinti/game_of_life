require "./game_of_life"
require "./animator"

game = GameOfLife.new [
  [0,0], [0,1],
  [1,0], [1,1]
]

Animator.new(game).animate(border: true)
