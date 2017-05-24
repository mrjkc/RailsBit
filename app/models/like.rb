class Like < ActiveRecord::Base
    belongs_to :video
    belongs_to :article
    belongs_to :user
    
    validates_uniqueness_of :user, scope: [:article, :video]
end