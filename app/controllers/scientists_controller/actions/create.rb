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
        def create(params)
          Scientist.create!(params)
        end
      end
    end
  end
end
