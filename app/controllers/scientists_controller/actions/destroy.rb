# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      # destroys scientist along with his inventions, if any
      class Destroy
        def destroy(params)
          Scientist.find(params[:id]).destroy!
        end
      end
    end
  end
end
