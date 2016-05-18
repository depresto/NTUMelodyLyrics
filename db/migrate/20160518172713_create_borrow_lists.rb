class CreateBorrowLists < ActiveRecord::Migration
  def change
    create_table :borrow_lists do |t|
      t.string :club_property_id
      t.integer :user_id
      t.date :deadline

      t.timestamps null: false
    end
    remove_column :club_properties, :user_id, :integer
    remove_column :club_properties, :deadline, :date
  end
end
