require 'rails_helper'

RSpec.describe Venue, type: :model do

  it { should validate_presence_of :name }
  it { should have_many :shows }

end
