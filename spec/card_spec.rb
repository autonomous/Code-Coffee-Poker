require File.join(File.dirname(__FILE__), 'spec_helper')

describe Card do
  it 'creates a card' do
    card = Card.new(5, :diamond)
    card.should_not be_nil
  end
  
  it 'has a rank and suit' do
    card = Card.new 2, :spade
    card.suit.should eql(:spade)
    card.value.should eql(2)
  end
  
  it 'is equal based on value and suit' do
    card1 = Card.new(:ace, :diamond)
    card2 = Card.new(:ace, :diamond)
    card1.should eql(card2 )
  end
end