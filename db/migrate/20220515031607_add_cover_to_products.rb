class AddCoverToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :cover, :string
  end
end
