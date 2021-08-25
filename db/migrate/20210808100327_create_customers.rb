class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
