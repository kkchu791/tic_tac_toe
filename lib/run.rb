require_relative 'tic_tac_toe.rb'
require_relative 'board.rb'
require_relative 'io_tic_tac_toe.rb'
require_relative 'matrix_renderer.rb'

game = TicTacToe.new(Board, IOTicTacToe, MatrixRenderer)
game.start
