require File.join(File.dirname(__FILE__), 'spec_helper')

describe Deck, 'by default' do
  # is implicitly done :)
  # subject{ Deck.new }
  
  let(:two_of_spades){ Card.new(2, :spade) }
 
  it { should respond_to(:<<) }
 
  it 'has 0 cards' do
    subject.size.should == 0
  end
  
  it 'can have cards added' do
    expect {
      subject.add_card two_of_spades
    }.to change( subject, :size ).by(1)
  end
  
  it 'can draw card' do
    subject << two_of_spades
    expect {
      subject.draw_card.should be_an_instance_of( Card )
    }.to change( subject, :size ).by( -1 )
  end
  
  it 'should draw the top card' do
    subject << two_of_spades
    subject << Card.new( 1, :diamond )
    
    subject.draw_card.should == two_of_spades
  end
  
  it 'can be shuffled'
  
  it 'can be sorted'
  
end

describe 'Standard deck' do
  subject { Deck.standard }
  
  it 'has 52 cards' do
    subject.size.should == 52
  end
  
  ([:ace, :king, :queen, :jack] + (2..10).to_a).each do |value|
    [:spade, :heart, :club, :diamond].each do |suit|
      it "has a #{value} of #{suit}" do
        subject.cards.should include(Card.new(value, suit))
      end
    end
  end
end