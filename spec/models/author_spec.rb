require 'rails_helper'

RSpec.describe Author, type: :model do

  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }
  it { should have_many :songs }

end
