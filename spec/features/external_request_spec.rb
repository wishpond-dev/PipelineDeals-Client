require 'spec_helper'

describe 'External request' do
  it 'tries to hit the pipelinedeals api' do
    uri = 'https://pipelinedeals.com'

    response = HTTParty.get(uri)

    expect(response.body).to eq("stubbed response")
  end

end
