class CreateSympathies < ActiveRecord::Migration[5.2]
  def change
    create_table :sympathies do |t|
      t.integer :customer_id
      t.integer :post_id

      t.timestamps
    end
  end
end
