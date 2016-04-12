class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, options: "DEFAULT CHARSET=utf8" do |t|
      t.string :title
      t.string :body, limit: 3000
      t.integer :user_id

      t.timestamps
    end
  end
end
