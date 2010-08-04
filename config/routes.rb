ActionController::Routing::Routes.draw do |map|
  map.resources :verbs, :collection => { :search => :get }
  map.root :controller => "verbs", :action => "search"
  map.connect "/:s", :controller => "verbs", :action => "index"
end
