class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :number, unique: true
      t.decimal :balance, :precision => 10, :scale => 4
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
