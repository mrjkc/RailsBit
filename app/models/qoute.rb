class Qoute < ActiveRecord::Base
            
    def self.process_quote(q)
        current_date_array = ((Time.now).to_s.split("-"))[2].split(" ")
        counter = 1
        q.each do |x|
            if current_date_array[0][0,1] == '0'
                current_date_array[0] = current_date_array[0][1,1]
            end
            if counter.to_s == current_date_array[0]
                return x
            end 
            counter += 1
        end
    end
end
