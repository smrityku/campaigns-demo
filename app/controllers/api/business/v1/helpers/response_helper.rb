# frozen_string_literal: true

module API::Business::V1::Helpers
  module ResponseHelper
    extend Grape::API::Helpers

    def success_response_with_json(msg, data = {})
      {
        success: true,
        message: msg,
        data: data
      }
    end

    def failure_response_with_json(msg, data = {})
      {
        success: false,
        message: msg,
        data: data
      }
    end
  end
end
