require 'rails_helper'

RSpec.describe 'Ibans', type: :request do
  describe 'GET #index' do
    before do
      Iban.create(name: 'iban_name')
      Iban.create(name: 'iban_name_2')
    end

    it 'returns all Ibans' do
      get '/ibans'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq Iban.all.to_json
    end
  end

  describe 'POST #create' do
    it 'creates an Iban with the params name' do
      params = { name: 'iban_name' }

      expect { post '/ibans', params: params }.to change { Iban.count }.by(1)
      expect(response).to have_http_status(:created)
      expect(response.body).to eq 'Iban created successfully'
      expect(Iban.last.name).to eq params[:name]
    end
  end

  describe 'GET #show' do
    before do
      Iban.create(name: 'iban_name')
      Iban.create(name: 'iban_name_2')
    end

    it 'returns all Ibans' do
      get '/ibans/iban_name'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq Iban.find_by(name: 'iban_name').to_json
    end
  end

  describe 'PUT #update' do
    before do
      Iban.create(name: 'iban_name')
      Iban.create(name: 'iban_name_2')
    end

    it 'returns all Ibans' do
      params = { new_name: 'new_iban_name_2' }
      put '/ibans/iban_name_2', params: params

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq 'Iban updated successfully'
      expect(Iban.find_by(name: 'new_iban_name_2')).to be_present
    end
  end

  describe 'DELETE #destroy' do
    before do
      Iban.create(name: 'iban_name')
      Iban.create(name: 'iban_name_2')
    end

    it 'deletes an Iban' do
      expect { delete '/ibans/iban_name' }.to change { Iban.count }.by(-1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq 'Iban deleted successfully'
      expect(Iban.find_by(name: 'iban_name')).not_to be_present
    end
  end

  describe 'GET #random' do
    before do
      Iban.create(name: 'iban_name')
      Iban.create(name: 'iban_name_2')
    end

    it 'returns a random Iban' do
      get '/random_iban'

      expect(response).to have_http_status(:ok)
      expect(Iban.all.to_json).to include response.body
    end
  end
end
