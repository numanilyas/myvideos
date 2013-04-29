class AddIndexToVideoCategories < ActiveRecord::Migration
  def change
    add_index :video_categories, :category, unique: true
  end
end
