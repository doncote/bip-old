class Annotation < ActiveRecord::Base

  belongs_to :track

  validates :desc, :track, presence: true

end
