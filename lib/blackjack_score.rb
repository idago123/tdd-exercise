# frozen_string_literal: true

# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze


def blackjack_score(hand)
  scores = []
  if hand.length > 5
    raise ArgumentError.new("The hand cannot contain more than 5 cards")
  elsif hand.length < 2
    raise ArgumentError.new("The hand cannot contain fewer than 2 cards")
  end

  hand.each do | card |
      if card == 'Jack' || card == 'Queen' || card == 'King'
        scores << 10
      elsif !(VALID_CARDS.include?(card))
        raise ArgumentError.new("Invalid card value")
      elsif card == 'Ace'
        scores << 11
      else
        scores << card
      end
  end
  while scores.sum > 21
    ace_eleven = scores.find_index(11)
    if ace_eleven.nil?
      raise ArgumentError.new("Bust!")
    else
      scores[ace_eleven] = 1
    end
  end

  return scores.sum
end

