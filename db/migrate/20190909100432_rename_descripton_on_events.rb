class RenameDescriptonOnEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :descripton, :description
  end
end
