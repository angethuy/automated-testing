
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = validate_input(value, "value")
    @suit = validate_input(suit, "suit")
  end

  def to_s
    case value
    when *[2..10]
      face_value = value
    when 11
      face_value = "Jack"
    when 12
      face_value = "Queen"
    when 13
      face_value = "King"
    when 1
      face_value = "Ace"
    end
    return "#{face_value} of #{suit.to_s}"
  end

  def validate_input(input, type)
    if type == "value"
      if !([*1..13].include? input)
        raise ArgumentError.new("Card value must be 1-13.")
      end
    end
    if type == "suit"
      if !([:hearts, :spades, :clubs, :diamonds].include? input)
        raise ArgumentError.new("Card suit must be one of: hearts, spades, clubs, diamonds.")
      end
    end
    return input
  end
end