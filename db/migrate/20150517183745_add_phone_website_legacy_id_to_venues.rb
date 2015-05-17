class AddPhoneWebsiteLegacyIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :phone, :string
    add_column :venues, :website, :string
  end
end
