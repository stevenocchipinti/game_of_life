require "./game_of_life"
require "./animator"

game = GameOfLife.new [
  [false, false, false, false, false, false],
  [false, true,  true,  false, false, false],
  [false, true,  false, true,  false, false],
  [false, false, true,  false, false, false],
  [false, false, false, false, false, false]
]

Animator.new(game).animate
