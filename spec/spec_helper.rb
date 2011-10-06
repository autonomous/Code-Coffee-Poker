require 'rubygems'
require 'rspec'

%w(deck card dealer player).each do |file|
  require File.join(File.dirname(__FILE__), '..', 'lib', file)
end