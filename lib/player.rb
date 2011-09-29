class Player
  attr_reader :cards
  
  def <<(cards)
    @cards = cards
  end
  
  def discard
    [@cards.pop]
  end
end