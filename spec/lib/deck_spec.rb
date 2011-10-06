require 'spec_helper'

describe Deck, 'by default' do
  # is implicitly done :)
  # subject{ Deck.new }
  
  let(:two_of_spades){ Card.new(2, :spade) }
  
  def standard_deck
    Deck.standard
  end
 
  it { should respond_to(:<<) }
  it { should respond_to(:draw_cards) }
 
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
    expect do
      subject.draw_card.should be_an_instance_of( Card )
    end.to change( subject, :size ).by( -1 )
  end
  
  it 'can draw more than one card' do
    deck = standard_deck
    expect do
      deck.draw_cards(3).should be_an_instance_of( Array )
    end.to change( deck, :size).by( -3 )
  end
  
  it 'should draw the top card' do
    subject << two_of_spades
    subject << Card.new( 2, :diamond )
    
    subject.draw_card.should == two_of_spades
  end
  
  it "should have a chainable add_card" do
    subject.add_card(two_of_spades).should be_an_instance_of(Deck)
  end
  
  it 'can be shuffled!' do
    deck = standard_deck
    expect do
      deck.shuffle!
    end.to change( deck, :cards )
  end
  
  it 'can be shuffled' do
    deck = standard_deck
    expect do
      deck.shuffle.should be_a_kind_of( Deck )
    end.to_not change( deck, :cards ) 
  end
end

describe 'Standard deck' do
  subject { Deck.standard }
  
  it 'has 52 cards' do
    subject.size.should == 52
  end
  
  [:ace, :king, :queen, :jack, *2..10].each do |rank|
    [:spade, :heart, :diamond, :club].each do |suit|
      it "has a #{rank} of #{suit}" do
        subject.cards.should include(Card.new(rank, suit))
      end
    end
  end
  
  it 'is sorted'
end