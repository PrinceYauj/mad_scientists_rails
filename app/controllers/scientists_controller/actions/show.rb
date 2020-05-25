# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      class Show
        def show(params)
          Scientist.find(params[:id])
        end
      end
    end
  end
end

