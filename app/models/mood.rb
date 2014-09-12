class Mood < ActiveRecord::Base
    belongs_to :user
    belongs_to :obii
    has_many :hangouts
    
    validates :user_id, presence: true
    validates :obii_id, presence: true
    validates :starts, presence: true
    validates :ends, presence: true
    
    def close!
        if (self.ends < Time.now)
            self.update_attributes(open: false)
        end
    end
    
end
