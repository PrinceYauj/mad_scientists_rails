# frozen_string_literal: true

require_relative 'application_controller/error_handler'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Byg::Support::ErrorHandler
  around_action :handle_exceptions

  def not_found
    render :not_found, status: :not_found
  end
end
