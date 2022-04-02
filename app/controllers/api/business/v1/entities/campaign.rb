# frozen_string_literal: true

module API
  module Business
    module V1
      module Entities
        class Campaign < Grape::Entity
          expose :id
          expose :name
          expose :target_amount
          expose :raised_percentage
          expose :investment_multiple
          expose :sector
          expose :country
          expose :created_at
          expose :image

          def raised_percentage
            (object&.raised_amount / object&.target_amount).to_f * 100
          end

          def image
            image_path(object&.image)
          end

          def image_path(obj)
            ActiveStorage::Blob.service.path_for(obj.key) if obj.attached?
          end
        end
      end
    end
  end
end
