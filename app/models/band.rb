class Band < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :sequentially_slugged

  validates :name, :slug, presence: true

  has_many :shows
  has_many :tracks, through: :shows
end
