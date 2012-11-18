module Api
  module V1
    class DataPointsController < ApiController
      rescue_from ActiveRecord::RecordNotFound do |exception|
        return head :not_found
      end
      
      def create
        [:value, :date].each { |key| return head :bad_request unless params.has_key?(key) }
        
        graph = Graph.find(params[:graph_id])
        
        point = graph.points.find_by_date(params[:date])
        if point
          if not point.update_attributes(:value => params[:value], :date => params[:date])
            return head :internal_server_error
          end
        else
          if not graph.points.create(:value => params[:value], :date => params[:date])
            return head :internal_server_error
          end
        end
        
        head :ok
      end    
    end    
  end
end
