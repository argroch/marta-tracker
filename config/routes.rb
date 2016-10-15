Rails.application.routes.draw do

	root 'station#index'

  get 'bus_tracker' => 'station#bus_tracker'
  post 'bus_tracker' => 'station#bus_tracker'
  
  get 'train_tracker' => 'station#train_tracker'
  post 'train_tracker' => 'station#train_tracker'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
