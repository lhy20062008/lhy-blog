class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, options: "DEFAULT CHARSET=utf8" do |t|
      t.integer :commentable_id
      t.string  :commentable_type
      t.integer :user_id
      t.text  :body
    end

    add_index :comments, [:commentable_id, :commentable_type]
  end
end
