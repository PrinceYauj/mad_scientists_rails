# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      class Update
        def initialize(params)
          @params = params.permit!.to_hash["scientist"].symbolize_keys
                      .slice(:madness, :attempts).compact
          @params[:id] = params["id"]
        end

        def update
          Scientist.find(params[:id]).update!(params)
          Scientist.find(params[:id])
        end

        private

        attr_reader :params

      end
    end
  end
end

