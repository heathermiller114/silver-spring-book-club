class Member < ActiveRecord::Base
    has_many :books
    has_many :reviews, through: :books
    has_secure_password
end