class ChangeDiscountInssName < ActiveRecord::Migration[5.2]
  def change
    rename_column :proponents, :discount_inss, :contribution
  end
end
