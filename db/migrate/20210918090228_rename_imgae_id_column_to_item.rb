class RenameImgaeIdColumnToItem < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :imgae_id, :image_id
  end
end
