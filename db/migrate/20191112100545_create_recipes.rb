class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.text :text1
      t.text :text2
      t.text :text3
      t.text :text4
      t.text :text5
      t.timestamps
    end
  end
end
