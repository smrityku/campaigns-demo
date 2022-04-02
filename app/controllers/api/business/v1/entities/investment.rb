# frozen_string_literal: true

module API
  module Business
    module V1
      module Entities
        class Investment < Grape::Entity
          expose :id
          expose :user_name
          expose :email
          expose :address
          expose :amount_invested
          expose :created_at
          expose :campaign, with: API::Business::V1::Entities::Campaign
        end
      end
    end
  end
end
