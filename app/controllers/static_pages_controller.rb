class StaticPagesController < ApplicationController
    
    def home
        @articles = Article.all
        @videos = Video.all
        @quotes = Qoute.all
        @daily_quote = Qoute.process_quote(@quotes)
    end
    
    def backend
        @articles = Article.all
        @videos = Video.all
    end
    
end
