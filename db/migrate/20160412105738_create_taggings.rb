class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings, options: "DEFAULT CHARSET=utf8" do |t|
      t.integer :tag_id
      t.integer :tagable_id
      t.string  :tagable_type

      t.timestamps
    end
  end
end
