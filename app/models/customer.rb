class Customer < ApplicationRecord
  validates :first_nm, presence: true , uniqueness: true
  validates :last_nm, presence: true , uniqueness: true
  has_many :orders
  has_many :reviews
end
