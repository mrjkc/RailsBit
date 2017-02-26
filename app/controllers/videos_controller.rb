class VideosController < ApplicationController
    
    def show 
       @videos = Video.all 
    end
end
