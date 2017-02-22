require 'station'

describe Station do
  subject {described_class.new(name: "Aldgate East", zone: 1)}

  it 'checks that a station has a name' do
    expect(subject.name).to eq('Aldgate East')
  end

  it 'checks that a station has a zone' do
    expect(subject.zone).to eq 1
  end

end
