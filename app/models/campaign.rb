# frozen_string_literal: true

class Campaign < ApplicationRecord
  has_one_attached :image
  has_many :investments, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name, :target_amount, :investment_multiple, :sector, :country
  validate :investment_multiple_constrains

  def image_file=(file)
    image&.attach(
      io: file[:tempfile],
      filename: file[:filename],
      content_type: file[:type],
      )
  end

  def investment_multiple_constrains
    if investemnt_multiple > 0 && (target_amount % investemnt_multiple) == 0
      errors.add(:investemnt_multiple, 'Please put some value which is a multiple of target amount')
    end
  end
end
