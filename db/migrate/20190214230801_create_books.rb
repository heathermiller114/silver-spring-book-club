class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :page_count
      t.string :plot
      t.string :genre
      t.integer :member_id
    end
  end
end
