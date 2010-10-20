require 'test_helper'

class SitemapControllerTest < ActionController::TestCase
  def test_sitemap_is_accessible
    get :show, :format => :xml
    assert_response :success
  end
end
