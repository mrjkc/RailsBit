class Comment < ActiveRecord::Base
    belongs_to :video
    belongs_to :article
    belongs_to :user
    
end