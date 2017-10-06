class AddCategoryIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :category_id, :integer
  	remove_column :categories, :category_id, :integer
  end
end
