require 'rails_helper'

RSpec.describe Band, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }

  it { should have_many :shows }
  it { should have_many :tracks }

end
