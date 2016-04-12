class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, options: "DEFAULT CHARSET=utf8" do |t|
      t.string :name

      t.timestamps
    end
  end
end
