class Video < ActiveRecord::Base
    has_many :likes
    has_many :comments
    
    def thumbs_up_total
        self.likes.where(likes: true).size
    end
    
    def thumbs_down_total
        self.likes.where(likes: false).size
    end
    
    def comments_total
        self.comments.where(video_id: self.id).size
    end
end
