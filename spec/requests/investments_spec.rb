require 'rails_helper'

RSpec.describe 'Investment APIs', type: :request do
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

  scenario 'Create Investment' do
    post '/api/v1/investments', params: {
      id: 1,
      user_name: 'Investor 1',
      email: 'investor_1@email.com',
      address: 'Investor Address',
      amount_invested: 40000,
      campaign_id: 1
    }

    # response should have HTTP Status 200 success
    expect(response.status).to eq(200)

    json = JSON.parse(response.body).deep_symbolize_keys

    # check the value of the returned response hash
    expect(json[:success]).to eq(true)
    expect(json[:message]).to eq('Investment created successfully')

    # 1 new Investment record is created
    expect(Investment.count).to eq(1)
  end

  describe 'Get all investments' do
    before {get '/api/v1/investments'}

    it 'returns all investments' do
      expect(JSON.parse(response.body)['message']).to eq('All investments fetched successfully')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get investment details' do
    before {get '/api/v1/investments/1'}

    it 'returns all investments' do
      expect(JSON.parse(response.body)['message']).to eq('Investment details fetched successfully')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
