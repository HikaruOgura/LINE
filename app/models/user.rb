class User < ActiveRecord::Base
    has_many :chats
    validates :name,presence:{ message: "ユーザー名が未入力です"}
end
