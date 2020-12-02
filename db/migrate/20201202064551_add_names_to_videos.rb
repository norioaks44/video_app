class AddNamesToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :position_id, :integer ,null: false
  end
end
