# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      # updates a scientist with provided parameters (if any)
      # missing parameters do not change
      # returns updated scientist
      class Update
        def update(params)
          old_id = params.delete(:old_id)
          Scientist.find(old_id).update!(params)
          if params[:id]
            Scientist.find(params[:id])
          else
            Scientist.find(old_id)
          end
        end
      end
    end
  end
end
