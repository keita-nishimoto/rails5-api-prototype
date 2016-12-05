class User < ApplicationRecord
  has_one :email, dependent: :destroy
  has_one :password, dependent: :destroy
end
