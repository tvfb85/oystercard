require 'station'

describe Station do
  subject(:station){described_class.new("Aldgate East", 1) }

  it 'checks that a station has a name' do
    expect(station.name).to eq('Aldgate East')
  end

  it 'checks that a station has a zone' do
    expect(station.zone).to eq 1
  end

end
