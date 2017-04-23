class Qoute < ActiveRecord::Base
    
    @control_date = Date.parse('2017-04-22')
    
    def self.process_quote(quote)
        current_date = (Time.now).to_s.split
        puts current_date[0]
        puts @control_date + 1
        if (@control_date + 1).to_s == current_date[0] 
            @control_date = current_date[0]
            return quote.last.quote
        end    
    end
end
