module Api
  module V1
    class SprintsController < ApiController
      def index
        @sprints = Sprint.all
      end

      def show
        @sprint = Sprint.find(params[:id])
      end

      def current
        @sprint = Sprint.current
        render :show
      end
    end    
  end
end