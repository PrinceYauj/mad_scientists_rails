# frozen_string_literal: true

require_relative 'scientists_controller/rest'
require_relative 'scientists_controller/prepare_params'

class ScientistsController < ApplicationController #:nodoc:
  include Byg
  include Byg::Support::Scientists

  def index
    @scientists = Byg::Rest::Scientists.index
  end

  def new
    @scientist = Scientist.new
  end

  def create
    @scientist = Byg::Rest::Scientists.create(prepare_create(params))
    redirect_to @scientist
  end

  def show
    @scientist = Byg::Rest::Scientists.show(params)
  end

  def edit
    @scientist = Scientist.find(params[:id])
  end

  def update
    @scientist = Byg::Rest::Scientists.update(prepare_update(params))
    redirect_to @scientist
  end

  def destroy
    Byg::Rest::Scientists.destroy(params)
    redirect_to scientists_path
  end
end
