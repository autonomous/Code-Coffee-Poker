class Dealer
  def initialize(deck)
    @deck = deck
  end
  
  def deal_hand
    @deck.cards.pop(5)
  end
end