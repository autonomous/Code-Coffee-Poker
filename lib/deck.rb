class Deck
  def initialize
    @cards = ([:ace, :king, :queen, :jack] + (1..10).to_a).map do |value|
      [:spade, :heart, :club, :diamond].map do |suit|
        Card.new(value, suit)
      end
    end.flatten
  end
  
  def size
    52
  end
  
  def cards
    @cards
  end
end