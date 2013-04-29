class RemoveIndexFromVideoCategories < ActiveRecord::Migration
  def up
    remove_index :video_categories, :column => :category
  end

  def down
  end
end
