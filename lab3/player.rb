require_relative "element"
require_relative "history"

class Player
    attr_reader :name, :history

    def initialize (name, history)
        @name = name
        @history = history
    end

    def play ()
        fail "This method should be overridden"
    end
end

class StupidBot < Player
    def play ()
        @history.log_play("Rock")
    end
end

class RandomBot < Player
    def play ()
        @history.log_play(%w(Rock Paper Scissors Lizard Spock).sample)
    end
end

class IterativeBot < Player
    def play ()
        @history.log_play((%w(Rock Paper Scissors Lizard Spock) - @history.plays[...4]).sample)
    end
end

class LastPlayBot < Player
    def play ()
        @history.log_play((@history.opponent_plays.length > 0) ? @history.opponent_plays[-1] : "Rock")
    end
end

class Human < Player
    def play ()
        begin
            puts "(1) Rock"
            puts "(2) Paper"
            puts "(3) Scissors"
            puts "(4) Lizard"
            puts "(5) Spock"
            prints "Enter your move: "
            n = gets.chomp.to_i
            puts "Invalid move - try again" if n > 5
        end while n > 5
        return %w(Rock Paper Scissors Lizard Spock)[n - 1]
    end
end
