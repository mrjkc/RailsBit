class VideosController < ApplicationController
    before_action :admin_user, only: [:destroy]
    
    def show 
       @videos = Video.all 
       puts current_user.name
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
