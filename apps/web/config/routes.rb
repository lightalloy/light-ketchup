# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
resources :time_entries, only: [:create, :destroy]
resources :time_stats, only: [:index]
root to: 'time_entries#index'
