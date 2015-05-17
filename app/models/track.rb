class Track < ActiveRecord::Base

  belongs_to :song
  belongs_to :show

  validates :song, :show, :position, :set, presence: true

end
