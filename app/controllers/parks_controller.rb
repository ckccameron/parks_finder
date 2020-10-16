class ParksController < ApplicationController
  def index
    state = params[:state]
    @parks = SearchFacade.parks(state)
  end
end
