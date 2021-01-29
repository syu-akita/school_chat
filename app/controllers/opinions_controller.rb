class OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all.order('created_at DESC')
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.save
  end

  private

  def opinion_params
    params.require(:opinion).permit(:subject, :text)
  end
end