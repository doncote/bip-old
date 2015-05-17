class Song < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :author, :slug, presence: true

  belongs_to :author
  has_many :tracks, dependent: :destroy

end
