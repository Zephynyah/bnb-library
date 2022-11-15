class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'sammy', password: 'wammy', except: [:index, :show]
end
