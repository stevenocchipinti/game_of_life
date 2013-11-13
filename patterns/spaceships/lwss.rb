require "./game_of_life"
require "./animator"

game = GameOfLife.new [
  [0,0],               [0,3],
                              [1,4],
  [2,0],                      [2,4],
         [3,1], [3,2], [3,3], [3,4]
]

Animator.new(game).animate(interval: 0.1, generations: 100)
