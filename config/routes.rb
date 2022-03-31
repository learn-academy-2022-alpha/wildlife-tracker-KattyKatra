Rails.application.routes.draw do
  get 'animal' => 'animal#index'
  get 'animal/:id' => 'animal#show'
  post 'animal' => 'animal#create'
  put 'animal/:id' => 'animal#update'
  delete 'animal/:id' => 'animal#destroy'
  post 'sightings' => 'sighting#create'
  get 'sightings' => 'sighting#index'
  get 'sightings/:id' => 'sighting#show'
  put 'sightings/:id' => 'sighting#update'
  delete 'sightings/:id' => 'sighting#destroy'
  get 'animal/:id/sightings' => 'animal#show_animal_sightings'
  root "animal#index"
end
