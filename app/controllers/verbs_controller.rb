class VerbsController < ApplicationController
  def index
    params[:s].downcase! unless params[:s].nil?
    @verbs = params[:s].blank? ? [] : Verb.build(params[:s][0..Verb::LONGEST])
    @suggestions = @verbs.empty? ? Conjugation.close_matches(params[:s][0..Verb::LONGEST]) : []
  end
  
  def search
  end
end
