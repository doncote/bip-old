class Author < ActiveRecord::Base

  validates :name, :slug, presence: true
  has_many :songs

end
