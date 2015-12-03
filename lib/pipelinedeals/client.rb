require "pipelinedeals/client/version"
require "httparty"

module Pipelinedeals
  class Client
    attr_reader :api_key

    API_URL = "https://api.pipelinedeals.com/api/v3/"

    def initialize(api_key)
      @api_key = "#{api_key}"
    end

    def ping
      response = users
      !response.has_key?("errors") && !response.has_key?("error")
    end

    def users(page = 1)
      get_request("users", "&page=#{page}")
    end

    def person_custom_fields(page = 1)
      get_request("/admin/person_custom_field_labels", "&page=#{page}")
    end

    def people(page = 1, per_page = 10000)
      get_request("people", "&page=#{page}&per_page=#{per_page}")
    end

    def create_person(data, endpoint = "people")
      post_request(data, endpoint)
    end

    def update_person(data, id, options = "")
      put_request(data, "people/#{id}", options)
    end

    private

    def uri_generator(endpoint, options = "")
      "#{API_URL}#{endpoint}.json?api_key=#{@api_key}#{options}"
    end

    def get_request(endpoint, options = "")
      response = HTTParty.get(uri_generator(endpoint, options))
      response.parsed_response
    end

    def post_request(data, endpoint, options = "")
     uri = uri_generator(endpoint, options)
     res = HTTParty.post(uri,
        :body => data,
        :header => { "Content-type" => "text/json"})
     res.response
    end

    def put_request(data, endpoint, options = "")
      uri = uri_generator(endpoint, options)
      res = HTTParty.put(uri,
        :body => data,
        :header => { "Content-type" => "text/json" })
      res.response
    end
  end
end
