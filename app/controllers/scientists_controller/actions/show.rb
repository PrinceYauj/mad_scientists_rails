# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      # returns particular scientist
      class Show
        def show(params)
          Scientist.find(params[:id])
        end
      end
    end
  end
end
