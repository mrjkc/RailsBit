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
    
    def like
        @video = Video.find(params[:id])
        if logged_in?
            like = Like.create(likes: params[:like], user: current_user, video: @video)
            if like.valid?
                flash[:success] = "Your selection was successful"
                redirect_to :back
            else
                flash[:danger] = "You can not select more than once"
                redirect_to :back
            end
        else
            flash[:warning] = "Please Login"
            redirect_to :back
        end
    end
    
    private
    
    def admin_user
       redirect_to(root_url) unless current_user.admin? 
    end
end
