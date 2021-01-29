class OpinionsController < ApplicationController
  def index
  end

  def new
    @opinion = Opinion.new
  end
end
