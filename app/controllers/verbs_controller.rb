class VerbsController < ApplicationController
  def index
    @verbs = params[:s].blank? ? [] : Verb.build(params[:s][0..Verb::LONGEST].downcase)
  end
  
  def search
  end
end
