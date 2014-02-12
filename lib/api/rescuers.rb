module API
  module Rescuers
    extend ActiveSupport::Concern

    included do
      rescue_from ::ActiveRecord::RecordNotFound, ::API::Exceptions::NotFound do
        if Date.today.mon == 4 && Date.today.mday == 1
          rack_response({'status' => '418', 'message' => '418 I\'m a teapot'}.to_json, 418)
        else
          rack_response({'status' => '404', 'message' => '404 Not found'}.to_json, 404)
        end
      end

      rescue_from ::API::Exceptions::NotAuthenticated do
        rack_response({'status' => '401', 'message' => '401 Unauthorized'}.to_json, 401)
      end

      # rescue_from ::API::Exceptions::NotAuthorized, CanCan::AccessDenied do
      #   rack_response({'status' => '403', 'message' => '403 Forbidden'}.to_json, 403)
      # end

      rescue_from Grape::Exceptions::ValidationErrors, ::API::Exceptions::ValidationErrors, ::ActiveModel::ForbiddenAttributesError, ::ActiveRecord::RecordInvalid do |e|
        e.message = "Trying to assing forbidden attributes" if e.message == ActiveModel::ForbiddenAttributesError
        rack_response({'status' => '422', 'message' => e.message}.to_json, 422)
      end

      rescue_from ::API::Exceptions::NoContent do
        rack_response({'status' => '204', 'message' => '204 No content'}.to_json, 204)
      end

      rescue_from :all do |exception|
        # lifted from https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/debug_exceptions.rb#L60
        # why is this not wrapped in something reusable?
        trace = exception.backtrace

        message = "\n#{exception.class} (#{exception.message}):\n"
        message << exception.annoted_source_code.to_s if exception.respond_to?(:annoted_source_code)
        message << "  " << trace.join("\n  ")

        API.logger.add Logger::FATAL, message
        rack_response({'status' => '500', 'message' => exception.message}.to_json, 500)
      end
    end
  end
end