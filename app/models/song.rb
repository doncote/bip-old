class Song < ActiveRecord::Base

  validates :title, :author, :slug, presence: true

  belongs_to :author

end
