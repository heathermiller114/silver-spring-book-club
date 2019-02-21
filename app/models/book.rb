class Book < ActiveRecord::Base
    has_many :member_books
    has_many :members, through: :member_books
    has_many :reviews


    def slug
        title.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        books = Book.all
        books.find {|book| book.slug == slug}
    end
end