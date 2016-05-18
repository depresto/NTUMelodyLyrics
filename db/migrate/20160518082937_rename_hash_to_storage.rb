class RenameHashToStorage < ActiveRecord::Migration
  def change
  	rename_column :images, :hash, :storage
  end
end
