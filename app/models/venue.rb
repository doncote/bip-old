class Venue < ActiveRecord::Base

  validates :name, :slug, presence: true

end
