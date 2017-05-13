class StaticPagesController < ApplicationController
    
    def about
    end
    
    def contact
        @contact_us = ContactU.new(contact_params)
    end
    
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
        
        def contact_params
           params.require(:contact_us).permit(:name, :email, :phone, :message)
        end
    
end
