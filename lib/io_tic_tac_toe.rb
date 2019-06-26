require_relative 'player.rb'

class IOTicTacToe
  class << self
    def print_welcome_message
      puts "Let's play Tic Tac Toe!" + "\n\n"
    end

    def get_players
      {player_x: "x", player_o: "o"}.map do |player, piece|
        puts "\n" + "#{player}, what is your name?"
        name = gets.chomp
        Player.new(name, piece, 0)
      end
    end

    def print_winner(name)
      puts "#{name} wins!" + "\n\n"
    end

    def print_tie_game
      puts "Tie game!" + "\n\n"
    end

    def print_score(player_1, player_2)
      puts "#{player_1.name}:#{player_1.score}  #{player_2.name}:#{player_2.score}" + "\n"
    end

    def choose_position(current_player_name)
      puts "#{current_player_name}'s turn."
      puts "Choose a number:" + "\n"
      position = gets.chomp.to_i
    end

    def get_play_again_response
      puts "Want to play again?(y/n)" + "\n"
      response = gets.chomp
    end
  end
end
