require 'journeylog'

describe Journeylog do
  subject(:journeylog){described_class.new}
  let(:entry_station) { double :station, :name => 'Aldgate East', :zone => 1 }
  let(:exit_station) { double :station, :name => 'Richmond', :zone => 4 }


  it 'should have an empty list of journeys by default' do
    expect(journeylog.journeys).to be_empty
  end

  it 'should start a journey' do
    subject.start(entry_station)
    expect(subject.current_journey.entry_station).to eq entry_station
  end

  it 'should end a journey' do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.current_journey).to eq nil
  end

  it 'complete journeys are added to the log' do
    # journeylog.finish(exit_station)
    # expect(journeylog.journeys[exit_station:]).to include exit_station
  end

end
