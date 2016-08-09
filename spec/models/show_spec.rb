require 'rails_helper'

RSpec.describe Show, type: :model do

  it { should belong_to :venue }
  it { should belong_to :band }
  it { should have_many(:tracks).dependent(:destroy) }
  it { should validate_presence_of :venue }
  it { should validate_presence_of :band }

  it 'sets slug properly' do
    venue = create(:venue)
    show = create(:show, venue: venue)

    puts show.slug

  end

  it 'delegates venue_name to venue' do
    venue = Venue.new(name: 'HOB')
    show = Show.new(venue: venue)
    expect(show.venue_name).to eq('HOB')
  end

  it 'delegates city to venue' do
    venue = Venue.new(city: 'Boston')
    show = Show.new(venue: venue)
    expect(show.venue_city).to eq('Boston')
  end

  it 'delegates state to venue' do
    venue = Venue.new(state: 'MA')
    show = Show.new(venue: venue)
    expect(show.venue_state).to eq('MA')
  end

end
