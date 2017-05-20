class Article < ActiveRecord::Base
    has_many :likes
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    def thumbs_up_total
        self.likes.where(likes: true).size
    end
    
    def thumbs_down_total
        self.likes.where(likes: false).size
    end
    
    private
        def picture_size
            if picture.size > 5.megabytes
               errors.add(:picture, "should be less than 5 megabytes")
            end
        end
end
