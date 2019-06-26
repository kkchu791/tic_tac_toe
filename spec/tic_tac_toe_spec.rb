require "pry-byebug"

require_relative '../lib/tic_tac_toe.rb'
require_relative "../lib/player.rb"
require_relative "../lib/board.rb"
require_relative "../lib/io_tic_tac_toe.rb"
require_relative "../lib/matrix_renderer.rb"

describe 'TicTacToe' do
  let(:tic_tac_toe) { TicTacToe.new(Board, IOTicTacToe, MatrixRenderer) }
  let(:io_tic_tac_toe) { IOTicTacToe }
  let(:player_1) { Player.new("Tom", "X", 0) }
  let(:player_2) { Player.new("Tom", "O", 0) }
  let(:current_player) { player_1 }
  let(:board) { Board.new }

  describe 'initialize' do
    context 'when dependencies are specified' do
      it "assigns board_class" do
         expect(tic_tac_toe.instance_variable_get(:@board_class)).to eq(Board)
      end

      it "assigns io_tic_tac_toe" do
        expect(tic_tac_toe.instance_variable_get(:@io_tic_tac_toe)).to eq(IOTicTacToe)
      end

      it "assigns matrix_renderer" do
         expect(tic_tac_toe.instance_variable_get(:@matrix_renderer)).to eq(MatrixRenderer)
      end
    end
  end

  describe 'start' do

    before do
      allow(io_tic_tac_toe).to receive(:print_welcome_message)
      allow(tic_tac_toe).to receive(:setup_options)
      allow(tic_tac_toe).to receive(:run)
    end

    it 'delegates printing of welcome pessage to io_tic_tac_toe' do
      expect(io_tic_tac_toe).to receive(:print_welcome_message)
      tic_tac_toe.start
    end

    it "runs setup options" do
      expect(tic_tac_toe).to receive(:setup_options)
      tic_tac_toe.start
    end

    it "runs the game" do
      expect(tic_tac_toe).to receive(:run)
      tic_tac_toe.start
    end
  end

  describe 'setup_options' do
    before do
      allow(io_tic_tac_toe).to receive(:get_players).and_return([player_1, player_2])
    end

    describe 'set_players' do
      it "delegates getting players to io_tic_tac_toe" do
        expect(io_tic_tac_toe).to receive(:get_players)
        tic_tac_toe.setup_options
      end

      it "correctly sets the players" do
        tic_tac_toe.setup_options
        expect(tic_tac_toe).to have_attributes(player_1: player_1,
                                               player_2: player_2,
                                               current_player: current_player)
      end
    end

    describe 'create_board' do
      it "correctly sets the board" do
        tic_tac_toe.setup_options
        expect(tic_tac_toe).to have_attributes(board: board)
      end
    end
  end
end
