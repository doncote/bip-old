require 'rails_helper'

RSpec.describe Song, type: :model do

  it { should validate_presence_of :author }
  it { should validate_presence_of :title }
  it { should validate_presence_of :slug }
  it { should belong_to :author }
  it { should have_many(:tracks).dependent(:destroy) }
  it { should have_many(:shows) }

end
