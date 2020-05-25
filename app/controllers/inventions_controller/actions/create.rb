# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      # creates the invention with provided parameters
      # accepting any hash, but slicing 
      # :name, :power and :scientist_id
      # if some parameters are not provided 
      # trying to initialize them with default values
      # and create a record anyway
      class Create
        def initialize(params)
          @params = params.permit!.to_hash["invention"].symbolize_keys
                      .slice(:name, :power, :scientist_id)
          @params[:name] ||= 'a'
          @params[:power] ||= 1
        end

        def create
          Invention.create!(params)
        end

        private

        attr_reader :params

      end
    end
  end
end

