class SitemapController < ApplicationController
  def show
    @conjugations = Conjugation.in_infinitive.all
  end
end
