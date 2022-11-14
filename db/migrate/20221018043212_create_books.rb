class CreateBooks < ActiveRecord::Migration[7.0]

  def change

    create_table :books do |t|

      t.string :userid



      t.integer :category_id



      t.string :name



      t.string :author



      t.string :price



      t.timestamps

    end

  end

end
