class RemoveCoverFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :cover, :string
  end
end
