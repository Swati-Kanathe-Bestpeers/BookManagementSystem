class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_nm
      t.string :last_nm
      t.string :title
      t.string :email
      t.integer :visit
      t.integer :order_count
      t.integer :lock_version

      t.timestamps
    end
  end
end
