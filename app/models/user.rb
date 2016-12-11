class User < ApplicationRecord
  has_one :email, dependent: :destroy
  accepts_nested_attributes_for :email

  has_one :password, dependent: :destroy
  accepts_nested_attributes_for :password

  has_one :name, dependent: :destroy
  accepts_nested_attributes_for :name
end
