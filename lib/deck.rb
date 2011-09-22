class Deck
  
  def self.standard
    deck = Deck.new
    ([:ace, :king, :queen, :jack] + (2..10).to_a).map do |value|
      [:spade, :heart, :club, :diamond].map do |suit|
        deck.add_card Card.new(value, suit)
      end
    end
    deck
  end

  attr_reader :cards
  
  def initialize
    @cards = []
  end
  
  def size
    @cards.size
  end
  
  def add_card card
    @cards << card
  end
  alias :<< :add_card
  
  def draw_card
    @cards.shift
  end
end