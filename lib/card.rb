class Card
  include Comparable
  
  SUITS = [:club, :diamond, :heart, :spade]
  RANKS = [*2..10, :jack, :queen, :king, :ace]
  
  attr_reader :suit, :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def <=>(other_card)
    i_rank = RANKS.index(rank)
    i_suit  = SUITS.index(suit)
    
    oi_rank = RANKS.index(other_card.rank)
    oi_suit  = SUITS.index(other_card.suit)
    
    if i_rank == oi_rank
      i_suit <=> oi_suit
    else
      i_rank <=> oi_rank
    end
  end
end