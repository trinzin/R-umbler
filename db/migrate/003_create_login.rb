class CreateLogin < ActiveRecord::Migration[5.0]
    def up
      create_table :Post do |t|
        t.string :first_name
        t.string :last_name
        t.string :email
        t.integer :transaction_id
      end
    end
  
    def down
      drop_table :login
    end
  end