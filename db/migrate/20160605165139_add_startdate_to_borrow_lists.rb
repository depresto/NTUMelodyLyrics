class AddStartdateToBorrowLists < ActiveRecord::Migration
  def change
    add_column :borrow_lists, :startdate, :date
  end
end
