class CreatePost < ActiveRecord::Migration[5.0]
    def up
      create_table :post do |t|
        t.string :text
        t.string :user-id
      end
    end
  
    def down
      drop_table :post
    end
  end