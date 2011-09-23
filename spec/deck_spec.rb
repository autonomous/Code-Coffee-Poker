require File.join(File.dirname(__FILE__), 'spec_helper')

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
  
  it 'can be shuffled' do
    cards = [*2..10].map{ |rank| Card.new(rank, :diamond) }
    cards.each do |card|
      subject << card
    end
    
    subject.cards.should == cards
    
    subject.shuffle!
    subject.cards.should_not == cards
    
    subject.cards.each do |card|
      cards.should include(card)
    end
    
    subject.cards.size.should == cards.size    
  end
  
  it 'can be sorted' do
    deck1 = standard_deck
    deck2 = standard_deck

    deck1.object_id.should_not == deck2.object_id
    
    deck1.shuffle!
    deck1.cards.should_not == deck2.cards
    
    deck1.sort!
    deck2.sort!
    deck1.cards.should == deck2.cards
  end
  
  [:sort!, :shuffle!].each do |method|
    it "should have a chainable #{method}" do
      subject.send(method).should be_an_instance_of(Deck)
    end

  end

  it "should have a chainable add_card" do
    subject.add_card(two_of_spades).should be_an_instance_of(Deck)
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
  
  it 'is sorted' do
    deck = Deck.standard.sort!
    subject.cards.should == deck.cards
  end
end