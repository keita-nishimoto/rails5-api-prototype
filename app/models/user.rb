class User < ApplicationRecord
  has_one :email, dependent: :destroy
  accepts_nested_attributes_for :email
end
