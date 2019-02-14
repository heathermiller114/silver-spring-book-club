class Book < ActiveRecord::Base
    belongs_to :member
    has_many :reviews
end