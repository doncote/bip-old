class Song < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:sequentially_slugged, :finders]

  validates :title, :author, :slug, presence: true

  belongs_to :author
  has_many :tracks, dependent: :destroy
  has_many :shows, through: :tracks

  def last_show_played
    shows.order("date desc").last
  end

  def times_played
    shows.uniq.count
  end

end
