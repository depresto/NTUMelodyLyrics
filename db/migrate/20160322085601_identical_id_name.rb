class IdenticalIdName < ActiveRecord::Migration
  def change
  	rename_column :calendars, :s_id, :c_id
  	rename_column :borrow_rooms, :s_id, :r_id
  	rename_column :borrow_keyboards, :s_id, :k_id
  	rename_column :borrow_books, :s_id, :b_id
  end
end
