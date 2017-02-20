require 'oyster'

describe Oystercard do
  subject(:card) {described_class.new}
# Write an RSpec test for the Oystercard class that will test that a freshly
# initialized card has a balance of 0 by default, see it fail, then write an
# implementation (Oystercard class code) that will make the test pass.
  it "has a balance of zero" do

    expect(card.balance).to eq 0
  end
end
