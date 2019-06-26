require "pry-byebug"

require_relative '../lib/tic_tac_toe.rb'
require_relative "../lib/player.rb"
require_relative "../lib/board.rb"
require_relative "../lib/io_tic_tac_toe.rb"
require_relative "../lib/matrix_renderer.rb"

describe 'TicTacToe' do
  let(:tic_tac_toe) { TicTacToe.new(Board, IOTicTacToe, MatrixRenderer) }
  
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
end
