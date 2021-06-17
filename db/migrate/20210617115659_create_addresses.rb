class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :public_place
      t.string :complement
      t.string :district
      t.references :citizen, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
