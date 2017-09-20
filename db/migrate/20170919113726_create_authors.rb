class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name      

      t.timestamps
    end

    create_table :authors_books, :id => false do |t|
      t.integer :author_id
      t.integer :book_id
    end
  end
end
