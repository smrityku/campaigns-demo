# frozen_string_literal: true

module API
  module Business
    class Base < Grape::API
      include API::Business::Defaults

      mount API::Business::V1::Campaigns
      mount API::Business::V1::Investments
    end
  end
end
