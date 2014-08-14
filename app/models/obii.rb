class Obii < ActiveRecord::Base
    has_and_belongs_to_many :users
    validates :name, :presence => true,
    :uniqueness => { :case_sensitive => false }
    
    validates :image, :presence => true,
    :uniqueness => true
    
end
