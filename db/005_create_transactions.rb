class CreateTransactions < ActiveRecord::Migration[5.0]
    def up
        create_table :transactions do |t|
      end
    end
  
    def down
      drop_table :transactions
    end
  end