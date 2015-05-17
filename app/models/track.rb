class Track < ActiveRecord::Base

  acts_as_taggable

  belongs_to :song
  belongs_to :show

  validates :song, :show, :position, :set, presence: true

end
