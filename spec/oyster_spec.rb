require 'oyster'

describe Oystercard do
  subject(:card) {described_class.new}

  describe "attributes" do
    it "has a default balance of zero" do
      expect(card.balance).to eq 0
    end
  end

  describe "Top-up" do
    it "increases the card balance" do
      expect { card.top_up 5 }.to change{ card.balance }.by 5
    end
    it "prevents max balance being exceeded" do
      maximum_balance = Oystercard::MAX_BALANCE
      message = "Maximum balance of £#{maximum_balance} exceeded"
      expect { card.top_up maximum_balance + 1 }.to raise_error message
    end
  end


  describe "Journey" do

    let(:station){double :station}

    context "touch-in" do
      # before :each do
      #   card.top_up(Oystercard::LIMIT)
      # end

      it 'checks the card has sufficient funds' do
        expect {card.touch_in(double :station)}.to raise_error "Insufficient funds on card"
      end

      it "raises an error if the card is already in use" do
        card.top_up(10)
        expect{ 2.times{card.touch_in(double :station)} }.to raise_error("Card already in journey")
      end

      it 'adds the entry station to the card' do
        card.top_up(10)
        card.touch_in(station)
        expect(card.entry_station).to eq(station)
      end

    end

  context "touch out" do

    it "removes the entry station on touch out" do
      card.top_up(10)
      card.touch_in(station)
      card.touch_out
      expect(card.entry_station).to be nil
      #expect{ card.touch_in }.to change{ card.in_journey? }.to true
    end

    it "decreases the card balance on touch out" do
      card.top_up(Oystercard::MIN_BALANCE)
      card.touch_in(double :station)
      expect{card.touch_out}.to change{ card.balance }.by -Oystercard::MIN_BALANCE
    end

    it 'updates the card to no longer in use' do
      card.top_up(10)
      card.touch_in(station)
      card.touch_out
      expect(card.in_journey?).not_to eq true
    end

    it "raises an error if the card is not already in a journey" do
      expect{ 2.times{card.touch_out} }.to raise_error("Card is not in a journey")
    end
  end


  describe 'entry_station' do
    let(:station) {double :station}
    it 'confirms card has an entry station on touch in' do
      card.top_up(Oystercard::MIN_BALANCE)
      card.touch_in(station)
      expect(card.entry_station).to eq(station)
    end
  end
end
end
