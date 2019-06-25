require_relative '../lib/board.rb'

describe 'Board' do
  let(:board) { Board.new }

  describe 'initialize' do
    it "initializes the grid" do
      expect(board.grid).to eq([[nil]*3]*3)
    end
  end

  describe 'update' do
    context 'when position and piece are given' do
      it "updates the board" do
        updated_board = [["X", nil, nil], [nil, nil, nil], [nil, nil, nil]]
        board.update(1, "X")
        expect(board.grid).to eq(updated_board)
      end
    end
  end

  describe 'valid_move?' do
    context 'when given a valid position' do
      it "returns true" do
        expect(board.valid_move?(1)).to eq(true)
      end
    end

    context 'when given an invalid position' do
      it "returns false" do
        expect(board.valid_move?(-1)).to eq(false)
      end
    end
  end

  describe 'playable?' do
    before do
      board.update(1, "X")
      board.update(2, "O")
      board.update(3, "X")
      board.update(4, "O")
      board.update(5, "X")
      board.update(6, "O")
    end

    context 'when board has moves left' do
      it "returns true" do
        expect(board.playable?).to eq(true)
      end
    end

    context 'when board has no moves left' do
      it "returns false" do
        board.update(7, "O")
        board.update(8, "X")
        board.update(9, "O")
        expect(board.playable?).to eq(false)
      end
    end

    context 'when board has has a connect_four and moves available' do
      it "returns false" do
        board.update(7, "X")
        expect(board.playable?).to eq(false)
      end
    end
  end

  describe 'has_tic_tac_toe?' do

    context 'when it has a vertical win' do
      before do
        board.update(1, "X")
        board.update(4, "X")
        board.update(7, "X")
      end

      it 'returns true' do
        expect(board.has_tic_tac_toe?).to eq(true)
      end
    end

    context 'when it has a horizontal win' do
      before do
        board.update(4, "X")
        board.update(5, "X")
        board.update(6, "X")
      end

      it 'returns true' do
        expect(board.has_tic_tac_toe?).to eq(true)
      end
    end

    context 'when it has a diagonal win' do
      before do
        board.update(3, "X")
        board.update(5, "X")
        board.update(7, "X")
      end

      it 'returns true' do
        expect(board.has_tic_tac_toe?).to eq(true)
      end

    end

    context 'when it has no win' do
      before do
        board.update(3, "X")
      end

      it 'returns false' do
        expect(board.has_tic_tac_toe?).to eq(false)
      end
    end
  end
end
