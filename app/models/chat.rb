class Chat < ActiveRecord::Base
    belongs_to :user
    has_many :messages
    validates :send_to_ID,presence:true
end
