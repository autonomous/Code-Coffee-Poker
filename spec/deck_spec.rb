require File.join(File.dirname(__FILE__), 'spec_helper')

describe Deck do
  subject{ Deck.new }
 
  it 'has 52 cards' do
    subject.size.should == 52
  end
  
  ([:ace, :king, :queen, :jack] + (1..10).to_a).each do |value|
    [:spade, :heart, :club, :diamond].each do |suit|
      it "has a #{value} of #{suit}" do
        subject.cards.should include(Card.new(value, suit))
      end
    end
  end
end