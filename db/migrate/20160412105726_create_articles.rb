class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, options: "DEFAULT CHARSET=utf8" do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
