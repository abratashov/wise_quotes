class QuotesController < ApplicationController
  def index
    #render :nothing => true
    render "application/main"
  end
end
