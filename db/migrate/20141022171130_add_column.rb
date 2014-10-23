class AddColumn < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_password, :string
  end
end
