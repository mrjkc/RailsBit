class StaticPagesController < ApplicationController
    
    def home
        @articles = Article.all
        @videos = Video.all
        @quotes = Qoute.all.sort
        @daily_quote = Qoute.process_quote(@quotes)
    end
    
    def backend
        @articles = Article.all
        @videos = Video.all
    end
    
    def create 
       @subscription = Subscription.new(subs_params) 
       if @subscription.save
           flash[:success] = "Successfully Subscribed!"
           redirect_to '/'
       end
    end
    
    private
        def subs_params
           params.require(:subscription).permit(:name, :email)
        end
    
end
