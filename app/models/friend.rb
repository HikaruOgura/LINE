class Friend < ActiveRecord::Base
    belongs_to :user
    validates :friend_id,presence:true
end
