require 'rails_helper'

RSpec.describe "ConsultationInterests", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/consultation_interests/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/consultation_interests/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end