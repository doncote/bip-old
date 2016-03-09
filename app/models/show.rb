class Show < ActiveRecord::Base
  extend FriendlyId
  friendly_id :date, use: [:sequentially_slugged, :finders]

  belongs_to :venue
  belongs_to :band

  has_many :tracks, dependent: :destroy

  validates :venue, :slug, :band, presence: true

  default_scope { order(:date) }

  def self.last_played
    order("date desc").last
  end

  def self.by_year(year)
    dt = DateTime.new(year)
    boy = dt.beginning_of_year
    eoy = dt.end_of_year
    where("date >= ? and date <= ?", boy, eoy)
  end

end
