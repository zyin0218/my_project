class AddRelationToUser < ActiveRecord::Migration[6.1]
  def change
    # add_column :products, :user_id, :integer
    add_belongs_to :products, :user, index: true
  end
end
