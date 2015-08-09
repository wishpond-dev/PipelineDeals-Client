require 'pipelinedeals/client'
require 'webmock/rspec'
require 'support/fake_pipelinedeals'
require 'pry'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://pipelinedeals.com").
      with(headers: {'Accept' => '*/*', 'User-Agent' => 'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})

    stub_request(:any, /https:\/\/api.pipelinedeals.com\/api\/v3\//).to_rack(FakePipelineDeals)
  end
end
