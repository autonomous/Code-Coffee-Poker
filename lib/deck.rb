class Deck
  
  def self.standard
    deck = Deck.new
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        deck.add_card Card.new(rank, suit)
      end
    end
    deck
  end

  attr_reader :cards
  
  def initialize(cards = nil)
    @cards = cards ? cards : []
  end
  
  def size
    @cards.size
  end
  
  def add_card card
    @cards << card
    self
  end
  alias :<< :add_card
  
  def draw_card(n=1)
    n == 1 ? @cards.shift : @cards.shift(n)
  end
  alias :draw_cards :draw_card
end