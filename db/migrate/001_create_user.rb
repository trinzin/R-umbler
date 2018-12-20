
class CreateUser < ActiveRecord::Migration[5.0]
  def up
    create_table : user do |t|
      t.string :email
      t.string :password
      t.integer :firstName
      t.integer :lastName
      t.integer :phoneNum
      t.string :gender
    end
  end

  def down
    drop_table :user
  end
end