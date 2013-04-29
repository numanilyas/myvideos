class CreateVideoCategories < ActiveRecord::Migration
  def change
    create_table :video_categories do |t|
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
