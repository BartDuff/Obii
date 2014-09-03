class Obii < ActiveRecord::Base
    mount_uploader :image, ObiiImageUploader
    has_many :interests, :dependent => :destroy
    has_many :users, through: :interests
    has_many :moods
    
    validates :name, :presence => true,
    :uniqueness => { :case_sensitive => false }
    
    validates :image, presence: true, processing: true
    
end
