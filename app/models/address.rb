class Address < ApplicationRecord
  belongs_to :citizen
  belongs_to :city
end
