# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :campaign

  validates_presence_of :user_name, :email, :address, :amount_invested
  validate :amount_invested_constrains

  def amount_invested_constrains
    if (amount_invested % (campaign&.investment_multiple || 1)) != 0
      errors.add('Investment Amount Error: ', 'Please put some value which is a multiple of campaign investment multiple')
      return
    end

    if amount_invested > ((campaign&.target_amount || 0) - (campaign&.raised_amount || 0))
      errors.add('Investment Amount Error: ', "You can not invest this amount. Please give amount below #{(campaign.target_amount - campaign.raised_amount)}")
    end
  end
end
