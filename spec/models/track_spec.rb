require 'rails_helper'

RSpec.describe Track, type: :model do

  it { should belong_to :song }
  it { should belong_to :show }

  it { should validate_presence_of :position }
  it { should validate_presence_of :set }
  it { should validate_presence_of :song }
  it { should validate_presence_of :show }
end
