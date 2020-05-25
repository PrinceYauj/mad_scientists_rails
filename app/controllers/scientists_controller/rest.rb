# frozen_string_literal: true

require_relative 'actions/actions.rb'

module Byg
  module Rest
    module Scientists
      def self.index
        Actions::Scientists::Index.new.index
      end

      def self.create(params)
        Actions::Scientists::Create.new(params).create
      end

      def self.show(params)
        Actions::Scientists::Show.new.show(params)
      end

      def self.update(params)
        Actions::Scientists::Update.new(params).update
      end

      def self.destroy(params)
        Actions::Scientists::Destroy.new.destroy(params)
      end
    end
  end
end

