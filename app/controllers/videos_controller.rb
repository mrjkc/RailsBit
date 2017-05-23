class VideosController < ApplicationController
    before_action :admin_user, only: [:destroy]
    
    def show
        @video = Video.find(params[:id])
        @articles = Article.all
    end
    
    def index 
       @videos = Video.paginate(page: params[:page], per_page: 9)
    end
    
    def destroy
       Video.find(params[:id]).destroy
       flash[:success] = "Video Deleted Successfully"
       redirect_to videos_url
    end
    
    private
    
    def admin_user
       redirect_to(root_url) unless current_user.admin? 
    end
end
