class CreateImports < ActiveRecord::Migration[8.0]
  def change
    create_table :imports do |t|
      t.string :user_email, null: false
      t.string :filename
      t.integer :total_rows, default: 0
      t.integer :created_count, default: 0
      t.integer :skipped_count, default: 0
      t.text :errors
      t.string :status, default: 'pending'
      t.datetime :completed_at

      t.timestamps
    end
    
    add_index :imports, :user_email
    add_index :imports, :status
  end
end