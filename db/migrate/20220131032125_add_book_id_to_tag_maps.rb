class AddBookIdToTagMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :tag_maps, :book_id, :integer
  end
end
