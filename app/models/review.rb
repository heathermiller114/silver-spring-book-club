class Review < ActiveRecord::Base
    belongs_to :book
    belongs_to :member
end