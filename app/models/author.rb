class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :slug, presence: true
  has_many :songs

end
