module ArticlesHelper
    
    def custom_each(array)
        for i in 0...array.length
            i += 1 
            return array[i]
        end
    end
    
end
