require 'rails_helper'

RSpec.describe Show, type: :model do

  it { should belong_to :venue }
  it { should have_many(:tracks).dependent(:destroy) }
  it { should validate_presence_of :venue }
  it { should validate_presence_of :slug}

end
