require 'rails_helper'

RSpec.describe Investment, type: :model do
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

  it 'belongs_to campaign' do
    assc = described_class.reflect_on_association(:campaign)
    expect(assc.macro).to eq :belongs_to
  end

  it 'is valid with valid attributes' do
    campaign = Investment.new(user_name: 'Investor 1',
                              email: 'investor_1@email.com',
                              address: 'Investor Address',
                              amount_invested: 40000,
                              campaign_id: 1)
    expect(campaign).to be_valid
  end

  it 'is not valid without a user_name' do
    campaign = Investment.new(user_name: 'Investor 1',
                              address: 'Investor Address',
                              amount_invested: 40000,
                              campaign_id: 1)
    expect(campaign).to_not be_valid
  end

  it 'is not valid without a email' do
    campaign = Investment.new(user_name: 'Investor 1',
                              address: 'Investor Address',
                              amount_invested: 40000,
                              campaign_id: 1)
    expect(campaign).to_not be_valid
  end

  it 'is not valid without a address' do
    campaign = Investment.new(user_name: 'Investor 1',
                              email: 'investor_1@email.com',
                              amount_invested: 40000,
                              campaign_id: 1)
    expect(campaign).to_not be_valid
  end

  it 'invalid for wrong multiple amount' do
    campaign = Investment.new(user_name: 'Investor 1',
                              email: 'investor_1@email.com',
                              address: 'Address',
                              amount_invested: 45000,
                              campaign_id: 1)
    expect(campaign).to_not be_valid
  end
end
