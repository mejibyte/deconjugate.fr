ActionController::Routing::Routes.draw do |map|
  map.resources :verbs, :collection => { :search => :get }
  map.root :controller => "verbs", :action => "search"
  map.resource :sitemap, :only => [ :show ], :controller => "sitemap"
  map.verb "/:s", :controller => "verbs", :action => "index"
end
