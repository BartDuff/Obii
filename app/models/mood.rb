class Mood < ActiveRecord::Base
    belongs_to :user
    belongs_to :obii
    
    validates :user_id, presence: true
    validates :obii_id, presence: true
    validates :starts, presence: true
    validates :ends, presence: true
    
end
