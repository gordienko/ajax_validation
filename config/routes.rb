AjaxValidation::Engine.routes.draw do
    post '/validate/(:id)' => 'application#validate'
end
