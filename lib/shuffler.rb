module Shuffler
  extend self
  
  def shuffle(deck)
    Deck.new(deck.cards.shuffle)
  end
end