class CombineClubPropertiesAndImages < ActiveRecord::Migration
  def change
  	add_column :club_properties, :image, :string
  	remove_column :club_properties, :image_id, :integer
  end
end
