# frozen_string_literal: true

module Byg
  module Support
    # transform ActionController::Parameters into hash
    module Scientists
      def prepare_create(params)
        res = params.permit!.to_hash['scientist'].symbolize_keys
                    .slice(:madness, :attempts).delete_if { |_, v| v.blank? }
        res[:madness] ||= 1
        res[:attempts] ||= 1
        res
      end

      def prepare_update(params)
        res = params.permit!.to_hash['scientist'].symbolize_keys
                    .slice(:madness, :attempts, :id)
                    .delete_if { |_, v| v.blank? }
        res[:old_id] = params[:id]
        res
      end
    end
  end
end
