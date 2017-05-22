module ArticlesHelper
    
    def custom_each(array)
        for i in 0...array.length
            i += 1 
            return array[i]
        end
    end
    
    def user_hash(user_id)
        @comments_user = User.all.index_by(&:id)
        @comments_user.each do |key , value|
            if key == user_id
               return value.name
            end
        end
    end
    
end
