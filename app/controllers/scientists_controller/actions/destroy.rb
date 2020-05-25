# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      class Destroy
        def destroy(params)
          Scientist.find(params[:id]).destroy!
        end
      end
    end
  end
end

