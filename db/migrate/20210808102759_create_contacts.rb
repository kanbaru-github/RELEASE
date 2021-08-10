class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.integer :customer_id
      t.string :email
      t.integer :subject
      t.text :message

      t.timestamps
    end
  end
end
