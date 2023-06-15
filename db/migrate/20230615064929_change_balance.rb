class ChangeBalance < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :balance, :decimal, default: 0, null: false
  end
end
