# frozen_string_literal: true

module API
  module Business
    module V1
      class Campaigns < Grape::API
        resource :campaigns do
          desc 'Return all campaigns'
          get do
            campaigns = Campaign.all
            present campaigns, with: API::Business::V1::Entities::Campaign
          end

          desc 'Return a campaign'
          params do
            requires :id, type: String, desc: 'ID of the campaign'
          end
          get ':id' do
            campaign = Campaign.where(id: params[:id]).first
            present campaign, with: API::Business::V1::Entities::Campaign
          end
        end
      end
    end
  end
end
