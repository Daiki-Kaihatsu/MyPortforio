class ChangeDataImageToBoardDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :board_details, :image,:image_id
  end
end
