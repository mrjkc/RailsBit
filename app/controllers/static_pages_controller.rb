class StaticPagesController < ApplicationController
    
    def home
        @articles = Article.all
        @videos = Video.all
        @quotes = Qoute.all
    end
    
    def backend
        @articles = Article.all
        @videos = Video.all
    end
    
end
