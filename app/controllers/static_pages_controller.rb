class StaticPagesController < ApplicationController
    
    def about
    end
    
    def contact
    end
    
    def new_contact
        @contact_us = ContactU.new(contact_us_params)
        if @contact_us.save
           flash[:success] = "Successfully Submitted!"
           redirect_to '/contact'
        end
    end
    
    def home
        @articles = Article.all.sort_by{| likes | likes.thumbs_up_total}.reverse
        @videos = Video.all.sort_by{| likes | likes.thumbs_up_total}.reverse
        @quotes = Qoute.all.sort
        begin
            @daily_quote = Qoute.process_quote(@quotes)
        rescue Exception => e  
            puts e.message  
        end
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
        
        def contact_us_params
           params.require(:contact_us).permit(:email, :phone, :name, :message)
        end
    
end
