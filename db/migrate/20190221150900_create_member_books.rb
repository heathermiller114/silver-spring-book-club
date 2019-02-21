class CreateMemberBooks < ActiveRecord::Migration
  def change
    create_table :member_books do |t|
      t.integer :member_id
      t.integer :book_id
    end
  end
end
