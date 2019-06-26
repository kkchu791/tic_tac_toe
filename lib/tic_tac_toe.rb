require "pry-byebug"

class TicTacToe
  attr_reader :board_class,
              :io_tic_tac_toe,
              :player_1,
              :player_2,
              :current_player,
              :board,
              :matrix_renderer

  def initialize(board_class, io_tic_tac_toe, matrix_renderer)
    @board_class = board_class
    @io_tic_tac_toe = io_tic_tac_toe
    @matrix_renderer = matrix_renderer
  end

  def start
    io_tic_tac_toe.print_welcome_message
    setup_options
    run
  end

  def setup_options
    set_players
    create_board
  end

  def run
    while board.playable?
      display_board
      handle_player_move
      switch_players
    end

    # we want to display the final board in the end to show the results
    # we want to switch players back to last player
    switch_players
    display_board

    if board.has_tic_tac_toe?
      handle_winner_game
    else
      handle_tie_game
    end
  end

  private

  def switch_players
    if current_player == player_1
      @current_player = player_2
    else
      @current_player = player_1
    end
  end

  def handle_player_move
    position = io_tic_tac_toe.choose_position(current_player.name)
    board.update(position, current_player.piece)
  end

  def set_players
    players = io_tic_tac_toe.get_players
    @player_1 = players[0]
    @player_2 = players[1]
    @current_player = player_1
  end

  def create_board
    @board = board_class.new
  end

  def display_board
    matrix_renderer.display_board(board.grid)
  end

  def play_again?(response)
    response == 'y' ? start_again : nil
  end

  def start_again
    switch_players
    create_board
    run
  end

  def update_winner_score
    current_player.score += 1
  end

  def handle_winner_game
    update_winner_score
    io_tic_tac_toe.print_winner(current_player.name)
    io_tic_tac_toe.print_score(player_1, player_2)
    play_again?(play_again_response)
  end

  def handle_tie_game
    io_tic_tac_toe.print_tie_game
    io_tic_tac_toe.print_score(player_1, player_2)
    play_again?(play_again_response)
  end

  def play_again_response
    io_tic_tac_toe.get_play_again_response
  end
end
