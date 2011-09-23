require File.join(File.dirname(__FILE__), 'spec_helper')

describe Card do
  it 'creates a card' do
    card = Card.new(5, :diamond)
    card.should_not be_nil
  end
  
  it 'has a rank and suit' do
    card = Card.new 2, :spade
    card.suit.should eql(:spade)
    card.rank.should eql(2)
  end
  
  context 'Comparisons' do
    it 'should be equal' do
      card1 = Card.new(:ace, :diamond)
      card2 = Card.new(:ace, :diamond)
      card1.should == card2
    end
    
    context 'Same rank, different suit' do
      [:heart, :diamond, :club].each do |sym|
        it "2 of spades is larger than 2 of #{sym}" do
          Card.new(2, :spade).should >(Card.new(2, :heart))
        end
      end
      
      it "2 of clubs is smaller than everything" do
        Card.new(2, :club).should <(Card.new(2, :heart))
        Card.new(2, :club).should <(Card.new(2, :spade))
        Card.new(2, :club).should <(Card.new(2, :diamond))
      end
      
      it "2 of diamonds is only larger than clubs" do
        Card.new(2, :diamond).should <(Card.new(2, :spade))
        Card.new(2, :diamond).should >(Card.new(2, :club))
        Card.new(2, :diamond).should <(Card.new(2, :heart))
      end
      
      it "2 of hearts id only smaller than spades" do
        Card.new(2, :heart).should <(Card.new(2, :spade))
        Card.new(2, :heart).should >(Card.new(2, :club))
        Card.new(2, :heart).should >(Card.new(2, :diamond))
      end
    end
    
    context 'Different ranks' do
      it '2 of spades is less than 3 of spades' do
        Card.new(2, :spade).should <(Card.new(3, :spade))
      end
      
      it 'ace is bigger than everything' do
        vals = Card::RANKS - [:ace]
        vals.each do |val|
          Card.new(:ace, :spade).should >(Card.new(val, :spade))
        end
      end
    end
  end
end