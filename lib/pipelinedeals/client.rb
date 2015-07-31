require "pipelinedeals/client/version"

module Pipelinedeals
  module Client
    attr_reader :api_key

    API_URL = "https://api.pipelinedeals.com/api/v3/"

    def initialize(api_key)
      @api_key = "#{api_key}"
    end

    def ping
      response = users
      !response.has_key?("error")
    end

    def users(page = 1)
      get_request("users", "&page=#{page}")
    end

    def custom_field_sets(page = 1)
      get_request("custom_field_sets", "&page=#{page}")
    end

    def people(page = 1)
      get_request("people", "&page=#{page}")
    end

    def create_person(data, endpoint = "people")
      post_request(data, endpoint)
    end

    private

    def uri_generator(endpoint, options = "")
      "#{API_URL}#{endpoint}.json?api_key=#{@token}#{options}"
    end

    def get_request(endpoint, options = "")
      response = HTTParty.get(uri_generator(endpoint, options))
      response.parsed_response
    end

    def post_request(data, endpoint, options = "")
     uri = uri_generator(endpoint, options)
     res = HTTParty.post(uri,
        :query => data,
        :header => { "Content-type" => "text/json"})
     res.response
    end
  end
end
