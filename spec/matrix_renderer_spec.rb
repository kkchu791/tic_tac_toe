require_relative '../lib/matrix_renderer.rb'
require_relative '../lib/board.rb'

describe 'MatrixRender' do
  context "when given a matrix with nothing filled in" do
    it "prints the board to the screen" do
      board = Board.new
      MatrixRenderer.display_board(board.grid)
      display_board =
                      "1 | 2 | 3" + "\n" +
                      "---------" + "\n" +
                      "4 | 5 | 6" + "\n" +
                      "---------" + "\n" +
                      "7 | 8 | 9" + "\n"

      expect{MatrixRenderer.display_board(board.grid)}.to output(display_board).to_stdout
    end
  end

  context "when given a matrix with slots filled in" do
    it "prints the board to the screen" do
      board = Board.new
      board.update(1, "X")
      board.update(2, "O")
      board.update(3, "X")

      MatrixRenderer.display_board(board.grid)
      display_board =
                      "X | O | X" + "\n" +
                      "---------" + "\n" +
                      "4 | 5 | 6" + "\n" +
                      "---------" + "\n" +
                      "7 | 8 | 9" + "\n"

      expect{MatrixRenderer.display_board(board.grid)}.to output(display_board).to_stdout
    end
  end
end
