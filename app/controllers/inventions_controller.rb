require_relative 'inventions_controller/rest.rb'

class InventionsController < ApplicationController
  include Byg
  def index
    @inventions = Byg::Rest::Inventions.index
  end

  def new
    @invention = Invention.new
  end

  def create
    @invention = Byg::Rest::Inventions.create(params)
    redirect_to @invention
  end

  def show
    @invention = Byg::Rest::Inventions.show(params)
  end

  def edit
    @invention = Invention.find(params[:id])
  end

  def update
    @invention = Byg::Rest::Inventions.update(params)
    redirect_to @invention
  end

  def destroy
    Byg::Rest::Inventions.destroy(params)
    redirect_to inventions_path
  end
end
