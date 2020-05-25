# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      # creates a Scientist with provided parameters
      # accepting any hash, but slicing :madness and :attempts
      # if some parameters are not provided
      # trying to initialize them with default values
      # and create a record anyway
      class Create
        def initialize(params)
          @params = params.permit!.to_hash["scientist"].symbolize_keys
                      .slice(:madness, :attempts)
          @params[:madness] ||= 1
          @params[:attempts] ||= 1
        end

        def create
          Scientist.create!(params)
        end

        private

        attr_reader :params

      end
    end
  end
end

