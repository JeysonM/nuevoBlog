class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.text :description
      t.integer :post_id
      t.integer :like
      t.references :post, index: true
      

      t.timestamps
    end
  end
end
