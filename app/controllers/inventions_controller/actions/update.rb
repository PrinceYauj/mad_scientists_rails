# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      class Update
        def initialize(params)
          @params = params.permit!.to_hash["invention"].symbolize_keys
                      .slice(:name, :power, :scientist_id).compact
          @params[:id] = params["id"]
        end

        def update
          Invention.find(params[:id]).update!(params)
          Invention.find(params[:id])
        end

        private

        attr_reader :params

      end
    end
  end
end

