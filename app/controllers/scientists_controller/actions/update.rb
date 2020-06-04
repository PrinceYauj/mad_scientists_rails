# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      class Update
        def update(params)
          Scientist.find(params[:id]).update!(params)
          Scientist.find(params[:id])
        end
      end
    end
  end
end
