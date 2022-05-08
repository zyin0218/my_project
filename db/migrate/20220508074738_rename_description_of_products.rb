class RenameDescriptionOfProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :descrtption, :description
  end
end
