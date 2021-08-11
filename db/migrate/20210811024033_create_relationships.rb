class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.integer "muter_id"
      t.integer "muted_id"

      t.timestamps
    end
  end
end
