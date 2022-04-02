# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :campaign

  validates_presence_of :user_name, :email, :address, :amount_invested
  validate :amount_invested_constrains

  def amount_invested_constrains
    if amount_invested > 0 && (campaign.target_amount % amount_invested) != 0
      errors.add('Investment Amount Error: ', 'Please put some value which is a multiple of campaign target amount')
      return
    end

    if amount_invested > (campaign.target_amount - campaign.raised_amount)
      errors.add('Investment Amount Error: ', "You can not invest this amount. Please give amount below #{(campaign.target_amount - campaign.raised_amount)}")
    end
  end
end
