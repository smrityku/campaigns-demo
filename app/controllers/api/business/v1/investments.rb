# frozen_string_literal: true

module API
  module Business
    module V1
      class Investments < Grape::API
        resource :investments do
          desc 'Create an investment'
          params do
            requires :user_name, type: String
            requires :email, type: String
            requires :address, type: String
            requires :amount_invested, type: Float
            requires :campaign_id, type: Integer
          end
          post do
            investment = Investment.create!(params)
            campaign = investment.campaign
            campaign.update(raised_amount: campaign.raised_amount + investment.amount_invested)

            investment = API::Business::V1::Entities::Investment.represent(investment)

            success_response_with_json('Investment created successfully', investment)
          rescue => error
            status :unprocessable_entity
            failure_response_with_json("Unable to create investment due to #{error.message}")
          end

          desc 'Return all investments'
          get do
            investments = Investment.all
            investments = API::Business::V1::Entities::Investment.represent(investments)

            success_response_with_json('All investments fetched successfully', investments)
          rescue => error
            status :unprocessable_entity
            failure_response_with_json("Unable to return investments due to #{error.message}")
          end

          desc 'Return an investment'
          params do
            requires :id, type: String, desc: 'ID of the investment'
          end
          get ':id' do
            investment = Investment.where(id: params[:id]).first
            investment = API::Business::V1::Entities::Investment.represent(investment)

            success_response_with_json('Investment details fetched successfully', investment)
          rescue => error
            status :unprocessable_entity
            failure_response_with_json("Unable to return investment details due to #{error.message}")
          end
        end
      end
    end
  end
end
