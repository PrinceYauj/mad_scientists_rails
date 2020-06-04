# frozen_string_literal: true

require_relative 'inventions_controller/rest'
require_relative 'inventions_controller/prepare_params'

class InventionsController < ApplicationController
  include Byg
  include Byg::Support::Inventions
  def index
    @inventions = Byg::Rest::Inventions.index
  end

  def new
    @invention = Invention.new
  end

  def create
    @invention = Byg::Rest::Inventions.create(prepare_create(params))
    redirect_to @invention
  end

  def show
    @invention = Byg::Rest::Inventions.show(params)
  end

  def edit
    @invention = Invention.find(params[:id])
  end

  def update
    @invention = Byg::Rest::Inventions.update(prepare_update(params))
    redirect_to @invention
  end

  def destroy
    Byg::Rest::Inventions.destroy(params)
    redirect_to inventions_path
  end
end
