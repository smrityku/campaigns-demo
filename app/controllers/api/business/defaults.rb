# frozen_string_literal: true

module API
  module Business
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix 'api'
        version 'v1', using: :path
        default_format :json
        format :json
        formatter :json, Grape::Formatter::Json

        before do
          status :ok
        end

        helpers do
          def permitted_params
            @permitted_params ||= declared(params,
                                           include_missing: false)
          end

          def logger
            Rails.logger
          end
        end

        helpers API::Business::V1::Helpers::ResponseHelper

        # Error handling

        rescue_from ::ActiveRecord::RecordNotFound do |exception|
          error!({ message: exception.message, status_code: Rack::Utils::SYMBOL_TO_STATUS_CODE[:not_found] })
        end

        rescue_from ::ActiveRecord::RecordInvalid do |exception|
          error!({ message: exception.message, status_code: Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity] })
        end

        rescue_from ::Exception do |exception|
          Rails.logger.info(exception.full_message)
          error!({ message: 'Sorry! Something went wrong.', status_code: Rack::Utils::SYMBOL_TO_STATUS_CODE[:internal_server_error] })
        end
      end
    end
  end
end
