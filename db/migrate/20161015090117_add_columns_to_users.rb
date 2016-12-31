class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :complement, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :gender, :integer
    add_column :users, :telephone, :string
    add_column :users, :comment, :text
    add_column :users, :birthday, :datetime
    add_column :users, :size, :float
  end
end
