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
        def create(params)
          Invention.create!(params)
        end
      end
    end
  end
end
