class AddcolumnToBooktable < ActiveRecord::Migration[7.0]
  def change
    add_column :books,:userid,:string
  end
end
