class Element 
    attr_accessor :name
    
    def initialize (name)
        @name = name
    end

    def compare_to (other)
        fail "This method should be overridden"
    end
end

class Rock < Element
    def compare_to (other)
        case other
        when "Lizard"
            return "Rock crushes Lizard", "Win"
        when "Scissors"
            return "Rock crushes Scissors", "Win"
        when "Paper"
            return "Paper covers Rock", "Lose"
        when "Spock"
            return "Spock vaporizes Rock", "Lose"
        when "Rock"
            return "Rock equals Rock", "Tie"
        end
    end
end

class Paper < Element
    def compare_to (other)
        case other
        when "Lizard"
            return "Lizard eats Paper", "Lose"
        when "Scissors"
            return "Scissors cut Paper", "Lose"
        when "Rock"
            return "Paper covers Rock", "Win"
        when "Spock"
            return "Paper disproves Spock", "Win"
        when "Paper"
            return "Paper equals Paper", "Tie"
        end
    end
end

class Scissors < Element
    def compare_to (other)
        case other
        when "Rock"
            return "Rock crushes Scissors", "Lose"
        when "Paper"
            return "Scissors cuts Paper", "Win"
        when "Lizard"
            return "Scissors decapitate Lizard", "Win"
        when "Spock"
            return "Spock smashes Scissors", "Lose"
        when "Scissors"
            return "Scissors equals Scissors", "Tie"
        end
    end
end

class Lizard < Element
    def compare_to (other)
        case other
        when "Rock"
            return "Rock crushes Lizard", "Lose"
        when "Paper"
            return "Lizard eats Paper", "Win"
        when "Scissors"
            return "Scissors decapitate Lizard", "Lose"
        when "Spock"
            return "Lizard poisons Spock", "Win"
        when "Lizard"
            return "Lizard equals Lizard", "Tie"
        end
    end
end

class Spock < Element
    def compare_to (other)
        case other
        when "Rock"
            return "Spock vaporizes Rock", "Win"
        when "Paper"
            return "Paper disproves Spock", "Lose"
        when "Scissors"
            return "Spock smsahes Scissors", "Win"
        when "Lizard"
            return "Lizard poisons Spock", "Lose"
        when "Spock"
            return "Spock equals Spock", "Tie"
        end
    end
end

$rock = Rock.new('Rock')
$paper = Paper.new('Paper')
$scissors = Scissors.new('Scissors')
$lizard = Lizard.new('Lizard')
$spock = Spock.new('Spock')

$moves = Array.[]($rock, $paper, $scissors, $lizard, $spock)