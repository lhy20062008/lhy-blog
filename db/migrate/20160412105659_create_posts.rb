class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, options: "DEFAULT CHARSET=utf8" do |t|
      t.string :title
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end
end
