class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :integer
    add_column :users, :about, :text
    add_column :users, :artists, :text
  end
end
