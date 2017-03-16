class User < ActiveRecord::Base
    has_many :chats
    has_many :friends
    validates :name,presence:{ message: "ユーザー名が未入力です"}
end
