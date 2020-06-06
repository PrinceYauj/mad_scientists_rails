# frozen_string_literal: true

module Byg
  module Support
    # provides error handling for all application controller
    module ErrorHandler
      def handle_exceptions
        yield
      rescue ActiveRecord::RecordNotFound => @e
        render :not_found, status: :not_found if @e
      rescue StandardError => @e
        render :error, status: :bad_request if @e
      end
    end
  end
end
