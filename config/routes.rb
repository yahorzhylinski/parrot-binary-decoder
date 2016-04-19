Rails.application.routes.draw do

  namespace :api do
    get 'sensor_values' => "sensor_values#index"
    post 'sensor_values/upload_data' => "sensor_values#upload_data"
  end

end
