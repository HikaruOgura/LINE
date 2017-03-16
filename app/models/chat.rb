class Chat < ActiveRecord::Base
    belongs_to :user
    validates :send_to_ID,presence:true
end
