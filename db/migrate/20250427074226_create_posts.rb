class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.timestamps
    end
    add_reference :posts, :user
  end
end
