class Iban < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
