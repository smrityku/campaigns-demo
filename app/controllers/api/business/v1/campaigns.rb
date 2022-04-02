# frozen_string_literal: true

module API
  module Business
    module V1
      class Campaigns < Grape::API
        resource :campaigns do
          desc 'Return all campaigns'
          get do
            campaigns = Campaign.all
            campaigns = API::Business::V1::Entities::Campaign.represent(campaigns)

            success_response_with_json('All campaigns fetched successfully', campaigns)
          rescue => error
            status :unprocessable_entity
            failure_response_with_json("Unable to return campaigns due to #{error.message}")
          end

          desc 'Return a campaign'
          params do
            requires :id, type: String, desc: 'ID of the campaign'
          end
          get ':id' do
            campaign = Campaign.where(id: params[:id]).first
            campaign = API::Business::V1::Entities::Campaign.represent(campaign)

            success_response_with_json('Campaign details fetched successfully', campaign)
          rescue => error
            status :unprocessable_entity
            failure_response_with_json("Unable to return campaign details due to #{error.message}")
          end
        end
      end
    end
  end
end
