class Member < ActiveRecord::Base
    has_many :books
    has_many :reviews, through: :books
    has_secure_password

    validates :email, :password, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }
end