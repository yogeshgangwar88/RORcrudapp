class ChangingusercolwrongToRight < ActiveRecord::Migration[7.0]
  def change
    rename_column :Books, :auther, :author
  end
end
