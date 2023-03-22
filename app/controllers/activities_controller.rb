class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        activity= Activity.all 
        render json: activity
    end

    def destroy
        activity=Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
      end

    def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
