class AddPostIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :post_id, :integer
  end
end
