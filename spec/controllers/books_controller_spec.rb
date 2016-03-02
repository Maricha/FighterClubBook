require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe "GET #index" do
    it "returns http good?" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end


  


end
