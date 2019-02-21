class MemberBooks < ActiveRecord::Base
    belongs_to :members
    belongs_to :books
end