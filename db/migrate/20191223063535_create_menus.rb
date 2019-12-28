class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :post, foreign_key: true
      t.string        :menu
      t.string        :amount
      t.timestamps
    end
  end
end
