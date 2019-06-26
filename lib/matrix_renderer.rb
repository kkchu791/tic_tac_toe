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
      add_numbers(matrix)

      display_board = ""
      matrix.each_with_index do |row, index|
        display_board += row.join(" | ") + "\n"
        display_board += "---------" + "\n" unless index == 2
      end

      puts display_board
    end

    private

    def add_numbers(matrix)
      (1..9).each do |num|
        if  matrix[BOARD[num][:row]][BOARD[num][:col]].nil?
           matrix[BOARD[num][:row]][BOARD[num][:col]] = num
        end
      end
    end
  end
end
