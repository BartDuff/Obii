class Interest < ActiveRecord::Base
    belongs_to :user
    belongs_to :obii
    
    validates :obii_id, presence: true
    validates :user_id, presence: true

end
