class LikesController < ApplicationController

      def create
        @like = current_user.likes.create(opinion_id: params[:opinion_id])
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @like = Like.find_by(opinion_id: params[:opinion_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
      end

      def already_liked?(opinion)
        self.likes.exists?(opinion_id: opinion.id)
      end

end
