require "./game_of_life"
require "./animator"

game = GameOfLife.new [
         [0,1], [0,2],
  [1,0],               [1,3],
         [2,1], [2,2]
]

Animator.new(game).animate(border: true)
