require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    # Arrange
    hand = ['Jack', 4, 2]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 16
  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hand = [3, 'Ace', 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 18
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Arrange
    hand = [3, 'Ace', 10]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 14
  end

  it 'raises an ArgumentError for invalid cards' do
    expect {
      blackjack_score(['cat', 2, 'dog'])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do
    expect {
      blackjack_score([10, 'Jack', 'King'])
    }.must_raise ArgumentError
  end
  it 'raises an ArgumentError if a hand contains more than 5 cards' do
    expect {
      blackjack_score([10, 'Jack', 'King', 4, 3, 1])
    }.must_raise ArgumentError
  end
end
