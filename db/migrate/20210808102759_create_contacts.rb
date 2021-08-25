class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.integer :subject, default: 0, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
