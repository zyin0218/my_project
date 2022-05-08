class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.string :name
      t.string :party
      t.integer :age
      t.text :politics
      t.integer :votes

      t.timestamps
    end
  end
end
