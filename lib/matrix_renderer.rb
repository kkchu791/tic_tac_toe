require "pry-byebug"

class MatrixRenderer
  BOARD = {
            1 => {row: 0, col: 0},
            2 => {row: 0, col: 1},
            3 => {row: 0, col: 2},
            4 => {row: 1, col: 0},
            5 => {row: 1, col: 1},
            6 => {row: 1, col: 2},
            7 => {row: 2, col: 0},
            8 => {row: 2, col: 1},
            9 => {row: 2, col: 2},
          }

  class << self
    def display_board(matrix)
      new_matrix = create_new_matrix_with_numbers(matrix)
      puts "\n" + visual_board(new_matrix) +"\n"
    end

    private

    def create_new_matrix_with_numbers(matrix)
      (1..9).map do |num|
        cell = matrix[BOARD[num][:row]][BOARD[num][:col]]
        cell.nil? ? num : cell
      end.each_slice(3).to_a
    end

    def visual_board(matrix)
      board = ""
      matrix.each_with_index do |row, index|
        board += row.join(" | ") + "\n"
        board += "---------" + "\n" unless index == 2
      end
      board
    end
  end
end
