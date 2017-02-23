require 'journey'

describe Journey do
  let(:entry_station){double :station}
  let(:exit_station){double :station}
  subject(:journey) {described_class.new(entry_station)}

  it 'sets the entry station at the start of a journey' do
    expect(journey.entry_station).not_to be nil
  end

  it 'sets the exit station at the end of a journey' do
    journey.set_exit(exit_station)
    expect(journey.exit_station).to eq exit_station
  end

  it 'checks if the journey is complete' do
    journey.set_exit(exit_station)
    expect(journey.journey_complete?).to eq true
  end

  it 'marks journey as incomplete if no touch out' do
    expect(journey.journey_complete?).not_to be true
  end

  it 'checks an incomplete journey raises a penalty' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'checks a complete journey is charged normal fare' do
    journey.set_exit(exit_station)
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end


end
