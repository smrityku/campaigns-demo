# frozen_string_literal: true

module API
  class Base < Grape::API
    mount API::Business::Base
  end
end
