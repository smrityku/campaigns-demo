require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it 'should have many investments' do
    investments = Campaign.reflect_on_association(:investments)
    expect(investments.macro).to eq(:has_many)
  end

  it 'is valid with valid attributes' do
    campaign = Campaign.new(name: 'Campaign 1',
                            target_amount: 100000,
                            investment_multiple: 10000,
                            sector: 'IT',
                            country: 'Bangladesh')
    expect(campaign).to be_valid
  end

  it 'is not valid without a name' do
    campaign = Campaign.new(target_amount: 100000,
                            investment_multiple: 10000,
                            sector: 'IT',
                            country: 'Bangladesh')
    expect(campaign).to_not be_valid
  end

  it 'is not valid without a sector' do
    campaign = Campaign.new(name: 'Campaign 1',
                            target_amount: 100000,
                            investment_multiple: 10000,
                            country: 'Bangladesh')
    expect(campaign).to_not be_valid
  end

  it 'is not valid without a country' do
    campaign = Campaign.new(name: 'Campaign 1',
                            target_amount: 100000,
                            investment_multiple: 10000,
                            sector: 'IT')
    expect(campaign).to_not be_valid
  end
end