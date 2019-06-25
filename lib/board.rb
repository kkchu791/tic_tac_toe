require "pry-byebug"

class Board
  ROW = 3
  COL = 3
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

  attr_reader :grid

  def initialize
    @grid = ROW.times.map { [nil]*COL }
  end

  def update(position, piece)
    if grid[BOARD[position][:row]][BOARD[position][:col]].nil?
       grid[BOARD[position][:row]][BOARD[position][:col]] = piece
       return
    end
  end

  def valid_move?(position)
    position > 0 && position < 10
  end

  def playable?
    has_tic_tac_toe? ? false : has_more_moves_available?
  end

  def has_tic_tac_toe?
    any_vertical? || any_horizontal? || any_diagonal?
  end

  private

  def has_more_moves_available?
    (0...ROW).any? do |row_index|
      (0...COL).any? do |col_index|
        grid[row_index][col_index].nil?
      end
    end
  end

  def any_vertical?
    (0...COL).any? do |col|
      piece = grid[0][col]

      next unless piece

      grid[1][col] == piece &&
      grid[2][col] == piece
    end
  end

  def any_horizontal?
    (0...ROW).any? do |row|
      piece = grid[row][0]

      next unless piece

      grid[row][1] == piece &&
      grid[row][2] == piece
    end
  end

  def any_diagonal?
    any_diagonal_descending? || any_diagonal_ascending?
  end

  def any_diagonal_descending?
    piece = grid[0][0]

    return false unless piece

    grid[1][1] == piece &&
    grid[2][2] == piece
  end

  def any_diagonal_ascending?
    piece = grid[2][0]

    return false unless piece

    grid[1][1] == piece &&
    grid[0][2] == piece
  end
end
