require "./game_of_life"
require "./animator"

game = GameOfLife.new [
  [true,  false, false, true,  false, false, false, false, false, false, false, false, false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, false, false, false, false],
  [true,  false, false, false, true,  false, false, false, false, false, false, false, false, false, false],
  [false, true,  true,  true,  true,  false, false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
]

Animator.new(game).animate(200)
