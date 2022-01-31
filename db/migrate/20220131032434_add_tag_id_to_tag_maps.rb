class AddTagIdToTagMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :tag_maps, :tag_id, :integer
  end
end
