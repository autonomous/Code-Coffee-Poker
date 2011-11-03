require 'spec_helper'

describe Hand do
  
  describe '.new' do
    it 'has 5 cards'
  end
  
  describe '#drop_cards' do
    it 'at most 4'
    
    it 'drop chosen card'
    
    it 'cant drop card not in hand'
  end
  
  describe '#add' do
    it 'adds a maximum of 4'
    
    it 'cant add to full hand'
  end
  
  describe '#<=>' do
    it 'knows royal flush is bigger than one pair'
    
    it 'knows about high card when comparing equivalent hands'
    
    it 'knows three of kind is bigger than pair'
  end
end