class Proponent < ApplicationRecord
  has_one :address
  before_validation :cpf
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :full_name, :cpf, :birth_date, :email, 
            :personal_phone, :salary, :contribution, presence: true

  validates :cpf, :email, uniqueness: true
  validates_format_of :email, with: EMAIL_FORMAT
  validates_format_of :cpf, with: /\A.[0-9]+\z/
  validates_length_of :cpf, is: 11

  def cpf=(cpf)
    write_attribute(:cpf, CPF.new(cpf).stripped)
  end
end
