class Like < ActiveRecord::Base
    belongs_to :video
    belongs_to :article
    
end