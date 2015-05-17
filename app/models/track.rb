class Track < ActiveRecord::Base

  belongs_to :song
  belongs_to :show
  has_many :annotations, dependent: :destroy

  validates :song, :show, :position, presence: true

end
