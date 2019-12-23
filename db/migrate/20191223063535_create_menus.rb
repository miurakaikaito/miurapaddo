class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer     :post_id
      t.string        :menu
      t.timestamps
    end
  end
end
