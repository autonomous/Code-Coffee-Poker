require 'spec_helper'

describe Dealer do
  it 'deals a hand of 5 cards' do
    dealer = Dealer.new(Deck.standard)
    hand = dealer.deal_hand
    hand.should have(5).cards
  end
  
  it 'deals a number of hands'
  
end