class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :post, foreign_key: true
      t.text     :recipe
      t.string     :image_url
      t.timestamps
    end
  end
end
