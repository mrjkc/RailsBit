class Article < ActiveRecord::Base
    has_many :likes
    has_many :comments
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    def thumbs_up_total
        self.likes.where(likes: true).size
    end
    
    def thumbs_down_total
        self.likes.where(likes: false).size
    end
    
    def comments_total
        self.comments.where(article_id: self.id).size
    end
    
    def comment_article
    end
    
    private
        def picture_size
            if picture.size > 5.megabytes
               errors.add(:picture, "should be less than 5 megabytes")
            end
        end
end
