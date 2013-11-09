require "./game_of_life"
require "./animator"

# Period = 2

game = GameOfLife.new [
  [false, false, false, false, false, false],
  [false, false, false, false, false, false],
  [false, false, true,  true,  true,  false],
  [false, true,  true,  true,  false, false],
  [false, false, false, false, false, false],
  [false, false, false, false, false, false]
]

Animator.new(game).animate
