class Show < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:sequentially_slugged, :finders]

  delegate :name, :city, :state, to: :venue, prefix: 'venue', allow_nil: true

  belongs_to :venue
  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :venue, :slug, :band, presence: true

  def slug_candidates
    [
      [:date_for_url, :venue_name, :venue_city, :venue_state]
    ]
  end

  def self.last_played
    order("date desc").last
  end

  def self.by_year(year)
    dt = DateTime.new(year)
    boy = dt.beginning_of_year
    eoy = dt.end_of_year
    where("date >= ? and date <= ?", boy, eoy)
  end

  private

  def date_for_url
    if date
      date.stamp('2015 01 29')
    else
      'unknown'
    end
  end

end
