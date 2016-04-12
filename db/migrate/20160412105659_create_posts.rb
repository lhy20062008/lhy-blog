class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, options: "DEFAULT CHARSET=utf8" do |t|
      t.string :title
      t.string :body, limit: 3000
      t.string :user_id

      t.timestamps
    end
  end
end
