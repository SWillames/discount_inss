class CreateProponents < ActiveRecord::Migration[5.2]
  def change
    create_table :proponents do |t|
      t.string :full_name
      t.string :cpf
      t.date :birth_date
      t.string :email
      t.string :personal_phone
      t.string :reference_phone
      t.float :salary
      t.float :discount_inss

      t.timestamps
    end
  end
end
