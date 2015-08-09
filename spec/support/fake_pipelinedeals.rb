require 'sinatra/base'

class FakePipelineDeals < Sinatra::Base

  get '/api/v3/people.json' do
    if check_token(params['api_key'])
      json_response(200, 'people.json')
    else
      json_response(200, 'error.json')
    end
  end

  get '/api/v3/users.json' do
    if check_token(params['api_key'])
      json_response(200, 'users.json')
    else
      json_response(200, 'error.json')
    end
  end

  get '/api/v3/admin/person_custom_field_labels.json' do
     if check_token(params['api_key'])
      json_response(200, 'person_custom_fields.json')
    else
      json_response(200, 'error.json')
    end
  end

  post '/api/v3/people.json' do
    if check_token(params['api_key'])
      json_response(201, 'create_person.json')
    else
      json_response(200, 'error.json')
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

  def check_token(token)
    token == '12345abcde'
  end
end
