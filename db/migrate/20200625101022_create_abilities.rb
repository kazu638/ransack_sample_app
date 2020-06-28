class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.string :ability, null: false, unique: true
      t.timestamps
    end
  end
end
