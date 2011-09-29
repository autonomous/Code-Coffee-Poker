require 'spec_helper'

describe Player do
  let(:dealer) { Dealer.new(Shuffler.shuffle(Deck.standard)) }
  let(:player) { Player.new }

  it "can hold cards" do
    player << dealer.deal_hand
    player.should have(5).cards
  end
  
  context 'with a hand' do
    before do
      player << dealer.deal_hand
    end
    
    it 'can discard cards' do
      player.discard.should be_an(Array)
    end
    
    it 'can only discard up to 4 cards'
    
    it 'discard 2 of spades'
  end

end