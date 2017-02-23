require 'oyster'
require 'journey'

describe Oystercard do
  subject(:card) {described_class.new}

  describe "attributes" do
    it "has a default balance of zero" do
      expect(card.balance).to eq(Oystercard::DEFAULT_BALANCE)
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

    let(:entry_station) {double :station }
    let(:exit_station) {double :station }
    let(:journey){Journey.new(entry_station)}
    let(:journeylog){Journeylog.new}

    context "touch-in" do
      # before :each do
      #   card.top_up(Oystercard::LIMIT)
      # end

      it 'checks the card has sufficient funds' do
        expect {card.touch_in(entry_station)}.to raise_error "Insufficient funds on card"
      end

      it "raises an error if the card is already in use" do
        card.top_up(Oystercard::MIN_BALANCE)
        expect{ 2.times{card.touch_in(entry_station)} }.to raise_error("Card already in use")
      end


      it 'adds the entry station to the card' do
        card.top_up(Oystercard::MIN_BALANCE)
        card.touch_in(entry_station)
        expect(journey.entry_station).to eq(entry_station)
      end

    end

  context "touch out" do
    it "decreases the card balance on touch out" do
      card.top_up(Oystercard::MIN_BALANCE)
      card.touch_in(entry_station)
      expect{card.touch_out(exit_station)}.to change{ card.balance }.by -Journey::MINIMUM_FARE
    end

    it 'updates the card to no longer in use' do
      card.top_up(Oystercard::MIN_BALANCE)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(journeylog.current_journey).to eq nil
    end

    it "charges a penalty if the card is touched out twice" do
      card.top_up(Oystercard::MIN_BALANCE)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect{card.touch_out(exit_station)}.to change {card.balance}.by -Journey::PENALTY_FARE
    end

    # it 'adds the exit station to the card' do
    #   card.top_up(Oystercard::MIN_BALANCE)
    #   card.touch_in(entry_station)
    #   card.touch_out(exit_station)
    #   expect(journey.exit_station).to eq(exit_station)
    # end
    #
    # it "removes the entry station on touch out" do
    #   card.top_up(Oystercard::MIN_BALANCE)
    #   card.touch_in(entry_station)
    #   card.touch_out(exit_station)
    #   expect(journey.current_journey).to be nil
    #   #expect{ card.touch_in }.to change{ card.in_journey? }.to true
    # end
    #
    #
    # let(:journey){ {entry_station: entry_station, exit_station: exit_station } }
    # it 'stores the entry and exit stations' do
    #   card.top_up(Oystercard::MIN_BALANCE)
    #   card.touch_in(entry_station)
    #   card.touch_out(exit_station)
    #   expect(journeylog.journeys).to include journey
    # end


  end


  # describe 'entry and exit stations' do
  #   let(:entry_station) {double :station}
  #   let(:exit_station) {double :station}
  #   it 'confirms card has an entry station on touch in' do
  #     card.top_up(Oystercard::MIN_BALANCE)
  #     card.touch_in(entry_station)
  #     expect(card.entry_station).to eq(entry_station)
  #   end
  # end
end
end
