class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :text
      t.bigint :price
      t.text :text2
      t.string :image

      t.timestamps
    end
  end
end
