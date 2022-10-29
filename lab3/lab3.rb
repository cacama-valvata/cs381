require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  Casey Colley 					 	#
#  colleyc@oregonstate.edu             	#
#										#
#########################################


def player_choose (n, m)
	case n
	when 1
		return StupidBot.new("Player #{m}", History.new)
	when 2
		return RandomBot.new("Player #{m}", History.new)
	when 3
		return IterativeBot.new("Player #{m}", History.new)
	when 4
		return LastPlayBot.new("Player #{m}", History.new)
	when 5
		return Human.new("Player #{m}", History.new)
	end
end

def game(rounds)

	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	puts

	puts "Please choose two players:"
	puts "(1) StupidBot"
	puts "(2) RandomBot"
	puts "(3) IterativeBot"
	puts "(4) LastPlayBot"
	puts "(5) Human"

	begin
		print "Select player 1: "
		n1 = gets.chomp.to_i
		print "Select player 2: "
		n2 = gets.chomp.to_i
		puts "Invalid choice(s) - start over" if (n1 > 5 || n2 > 5 || n1 < 1 || n2 < 1)
		puts if (n1 > 5 || n2 > 5 || n1 < 1 || n2 < 1)
	end while (n1 > 5 || n2 > 5 || n1 < 1 || n2 < 1)

	p1, p2 = player_choose(n1, 1), player_choose(n2, 2)
	puts "#{p1.class.name} vs. #{p2.class.name}"
	puts

	i = 0
	while i < rounds
		puts "Round #{i+1}"

		m1 = p1.play()
		m2 = p2.play()

		puts "#{p1.name} chose #{m1.name}"
		puts "#{p2.name} chose #{m2.name}"

		output, result = m1.compare_to(m2)
		puts output
		case result
		when "Win"
			p1.history.add_score
			puts "#{p1.name} won the round"
			puts
		when "Lose"
			p2.history.add_score
			puts "#{p2.name} won the round"
			puts
		when "Tie"
			puts "Round was a tie"
			puts
		end

		# Logging
		p1.history.log_opponent_play(m2)
		p2.history.log_opponent_play(m1)

		i += 1
	end

	puts "Final score is #{p1.history.score} to #{p2.history.score}"
	g = p1.history.score - p2.history.score
	case g
	when (...0)
		puts "#{p2.name} wins"
	when 0
		puts "Game was a draw"
	when (0..)
		puts "#{p1.name} wins"

	end
end

# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)