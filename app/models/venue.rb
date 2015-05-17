class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  validates :name, :slug, presence: true

  def slug_candidates
    [
      :name,
      [:name, :city],
      [:name, :city, :state],
    ]
  end

end
