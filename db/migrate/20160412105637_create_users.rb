class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, options: "DEFAULT CHARSET=utf8" do |t|
      t.string  :name,               default: ''  #  姓名
      t.string  :email,              default: ''  #  邮箱
      t.string  :hashed_password,    default: ''  #  密码
      t.string  :salt,               default: ''  #  密码

      t.timestamps
    end
  end
end
