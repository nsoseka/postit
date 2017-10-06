class Dropper < ActiveRecord::Migration
  def change
  	remove_column :posts, :category_id, :integer
  end
end
