Rails.application.routes.draw do
  get 'health', to: 'welcome#health'
  get 'info', to: 'welcome#info'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
