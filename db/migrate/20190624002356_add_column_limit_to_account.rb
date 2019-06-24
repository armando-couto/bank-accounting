class AddColumnLimitToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :limit, :decimal, :precision => 10, :scale => 4
  end
end
