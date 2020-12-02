class CreateVideoTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :video_tag_relations do |t|
      t.references :video, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
