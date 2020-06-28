class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :address, default: "内緒"
      t.timestamps
    end
  end
end