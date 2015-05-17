require 'rails_helper'

RSpec.describe Annotation, type: :model do

  it { should belong_to(:track).dependent(:destroy) }

  it { should validate_presence_of :track }
  it { should validate_presence_of :desc }

end
