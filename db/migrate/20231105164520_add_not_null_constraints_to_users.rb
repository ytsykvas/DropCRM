class AddNotNullConstraintsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :user_type, :string, null: false
    change_column :users, :company_name, :string, null: false
  end
end
