require 'rails_helper'

RSpec.describe 'Campaign APIs', type: :request do
  let!(:variables) {
    Campaign.create!(
      id: 1,
      name: 'Campaign 1',
      target_amount: 100000,
      investment_multiple: 10000,
      sector: 'IT',
      country: 'Bangladesh',
      )
  }

  describe 'Get all campaigns' do
    before {get '/api/v1/campaigns'}

    it 'returns all campaigns' do
      expect(JSON.parse(response.body)['message']).to eq('All campaigns fetched successfully')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get campaign details' do
    before {get '/api/v1/campaigns/1'}

    it 'returns all questions' do
      expect(JSON.parse(response.body)['message']).to eq('Campaign details fetched successfully')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
