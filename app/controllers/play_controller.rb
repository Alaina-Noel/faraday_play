require 'faraday'

  conn = Faraday.new('https://pets-1.herokuapp.com/api/v1/pets/')
  all_pets_response = conn.get('')
  all_pets = JSON.parse(all_pets_response.body, symbolize_name: true)

  one_pet_response = conn.get('46')
  one_pet = JSON.parse(one_pet_response.body, symbolize_name: true)
  
  post_a_pet_response = conn.post('', body = {
    "name": "Bugs",
    "animal_type": "bunny",
    "age": 5
    }, headers = nil)
    posted_pet = JSON.parse(post_a_pet_response.body, symbolize_name: true)
    
    pet_to_delete = posted_pet["id"]
    
    delete_pet_response = conn.delete("#{pet_to_delete}")
    
  post_a_pet_response = conn.post('', body = {
    "name": "Bugs",
    "animal_type": "bunny",
    "age": 5
    }, headers = nil)
    posted_pet = JSON.parse(post_a_pet_response.body, symbolize_name: true)
    pet_to_update = posted_pet["id"]
      
    update_a_pet_response = conn.patch("#{pet_to_update}", body = {
    "name": "Bugsssssssssssssss",
    "animal_type": "bunny",
    "age": 50
    }, headers = nil)
    updated_pet = JSON.parse(update_a_pet_response.body, symbolize_name: true)
    