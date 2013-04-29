class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :video_category_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
