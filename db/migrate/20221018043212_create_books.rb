class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :auther
      t.string :price

      t.timestamps
    end
  end
end
