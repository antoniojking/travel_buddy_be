module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render(json: { message: e.message }, status: :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render(json: { message: e.message }, status: :bad_request)
    end

    rescue_from ActiveRecord::Rollback do |e|
      render(json: { message: e.message }, status: :bad_request)
    end

    rescue_from ActiveRecord::ValidationError do |e|
      render(json: { message: e.message }, status: :bad_request)
    end
  end
end
