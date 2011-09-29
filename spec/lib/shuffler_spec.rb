require 'spec_helper'

describe Shuffler do
  
  it 'changes the order of a standard deck' do
    deck = Deck.standard
    shuffled_deck = Shuffler.shuffle(deck)
    shuffled_deck.cards.should_not == deck.cards
  end
  
  it 'should not create the same shuffled deck' do
    deck1 = Shuffler.shuffle Deck.standard
    deck2 = Shuffler.shuffle Deck.standard
    
    deck1.cards.should_not == deck2.cards
  end
  
  it 'does not lose cards' do
    deck = Deck.standard
    shuffled_deck = Shuffler.shuffle(deck)
    shuffled_deck.should have(52).cards
  end
end