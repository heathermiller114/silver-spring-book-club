require 'sinatra/flash'

class Member < ActiveRecord::Base
    include ActiveModel::Validations

    has_many :member_books
    has_many :books, through: :member_books
    has_many :reviews
    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }
end