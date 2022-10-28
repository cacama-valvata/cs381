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
        case other.name
        when "Lizard"
            return "Rock crushes lizard", "Win"
        when "Scissors"
            return "Rock crushes scissors", "Win"
        when "Paper"
            return "Paper covers rock", "Lose"
        when "Spock"
            return "Spock vaporizes rock", "Lose"
        when "Rock"
            return "Rock equals rock", "Tie"
        end
    end
end

class Paper < Element
    def compare_to (other)
        case other.name
        when "Lizard"
            return "Lizard eats paper", "Lose"
        when "Scissors"
            return "Scissors cut paper", "Lose"
        when "Rock"
            return "Paper covers rock", "Win"
        when "Spock"
            return "Paper disproves spock", "Win"
        when "Paper"
            return "Paper equals paper", "Tie"
        end
    end
end

class Scissors < Element
    def compare_to (other)
        case other.name
        when "Rock"
            return "Rock crushes scissors", "Lose"
        when "Paper"
            return "Scissors cuts paper", "Win"
        when "Lizard"
            return "Scissors decapitate lizard", "Win"
        when "Spock"
            return "Spock smashes scissors", "Lose"
        when "Scissors"
            return "Scissors equals scissors", "Tie"
        end
    end
end

class Lizard < Element
    def compare_to (other)
        case other.name
        when "Rock"
            return "Rock crushes lizard", "Lose"
        when "Paper"
            return "Lizard eats paper", "Win"
        when "Scissors"
            return "Scissors decapitate lizard", "Lose"
        when "Spock"
            return "Lizard poisons spock", "Win"
        when "Lizard"
            return "Lizard equals lizard", "Tie"
        end
    end
end

class Spock < Element
    def compare_to (other)
        case other.name
        when "Rock"
            return "Spock vaporizes rock", "Win"
        when "Paper"
            return "Paper disproves spock", "Lose"
        when "Scissors"
            return "Spock smsahes scissors", "Win"
        when "Lizard"
            return "Lizard poisons spock", "Lose"
        when "Spock"
            return "Spock equals spock", "Tie"
        end
    end
end

$rock = Rock.new('Rock')
$paper = Paper.new('Paper')
$scissors = Scissors.new('Scissors')
$lizard = Lizard.new('Lizard')
$spock = Spock.new('Spock')

$moves = Array.[]($rock, $paper, $scissors, $lizard, $spock)