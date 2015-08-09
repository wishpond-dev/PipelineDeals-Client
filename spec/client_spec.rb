require 'spec_helper'

describe Pipelinedeals::Client do
  subject { Pipelinedeals::Client.new }
  let(:api_key) { '12345abcde'}
  let(:client) { Pipelinedeals::Client.new(api_key)}
  let(:bad_api_key) { '12345abcd'}
  let(:bad_client) { Pipelinedeals::Client.new(bad_api_key)}

  describe '#initialize' do
    it 'stores the api_key' do
      expect(client.api_key).to eq(api_key)
    end
  end

  describe '#ping' do
    context 'good api_key' do
      it 'returns true' do
        response = client.ping
        expect(response).to be_truthy
      end
    end

    context 'bad_api_key' do
      it 'returns false' do
        response = bad_client.ping
        expect(response).to be_falsey
      end
    end
  end



  describe '#people' do
    it 'returns the collection of people' do
      response = client.people
      expect(response['pagination']['page']).to eq(1)
      expect(response['entries'].size).to eq(3)
    end

    context 'wrong api_key' do
      it "returns an error message" do
        response = bad_client.people
        expect(response['error']).to eq('Unknown api key')
      end
    end
  end

  describe '#users' do
    it 'return the collection of users' do
      response = client.users
      expect(response.has_key?('pagination')).to be_truthy
    end

    context 'wrong api_key' do
      it "returns an error message" do
        response = bad_client.users
        expect(response['error']).to eq('Unknown api key')
      end
    end
  end

  describe '#person_custom_fields' do
    it 'returns the collection of custom fields' do
      response = client.person_custom_fields
      expect(response.has_key?('pagination')).to be_truthy
    end

    context 'wrong api_key' do
      it "returns an error message" do
        response = bad_client.person_custom_fields
        expect(response['error']).to eq('Unknown api key')
      end
    end
  end
end
