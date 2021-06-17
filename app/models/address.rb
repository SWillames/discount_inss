class Address < ApplicationRecord
  belongs_to :proponent

  validates :zip_code, :public_place, :district, :city, :uf, presence: true
end
