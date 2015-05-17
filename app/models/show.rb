class Show < ActiveRecord::Base
  extend FriendlyId
  friendly_id :date, use: :slugged

  belongs_to :venue
  belongs_to :band

  has_many :tracks, dependent: :destroy

  validates :venue, :slug, presence: true

end
