require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET' do
    before do
      @user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
      )
      sign_in @user

      @category = Category.create(name: 'Pet', icon: Faker::Avatar.image, user: @user)

      get categories_path
    end

    it '#index should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it '#index should render the index template' do
      expect(response).to render_template(:index)
    end
    it '#index should include new category' do
      expect(assigns(:categories)).to match_array([@category])
    end
    it '#create should not accept empty params' do
      category_params = {
        name: 'Sports',
        icon: nil
      }
      expect { post categories_path, params: { category: category_params } }.not_to change(Category, :count)
      expect(response).to have_http_status(:found)
    end
  end
end
