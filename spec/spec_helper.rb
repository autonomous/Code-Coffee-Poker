require 'rubygems'
require 'rspec'

%w(deck card).each do |file|
  require File.join(File.dirname(__FILE__), '..', 'lib', file)
end