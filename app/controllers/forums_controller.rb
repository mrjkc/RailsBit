class ForumsController < ApplicationController
    def index
        @forums = Forum.all
    end
    
    def show
        @forum = Forum.find(params[:id])
    end 
    
    private
        def forum_params
            params.require(:forum).permit(:created_by, :user_id, :comments, :category,
            :title)
        end
end
