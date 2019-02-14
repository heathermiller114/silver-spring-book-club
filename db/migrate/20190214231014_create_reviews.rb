class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.timestamps
      t.integer :member_id
      t.integer :book_id
    end
  end
end
