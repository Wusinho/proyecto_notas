require 'rails_helper'

RSpec.describe HomePagesController, type: :request do
  let!(:user) { create(:user) }
  let!(:notes) { create_list(:note, 5, user: user) }

  describe "GET #index" do
    it "renders a successful response" do
      get home_pages_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:note) { create(:note, user: user) }

    it "renders a successful response" do
      get home_page_path(note)
      expect(response).to have_http_status(:success)
    end

    it "displays the requested note" do
      get home_page_path(note)
      expect(response.body).to include(note.title)
    end

    it "does not display other notes" do
      other_note = create(:note, user: user)
      get home_page_path(note)
      expect(response.body).to include(note.title)
      expect(response.body).not_to include(other_note.title)
    end
  end
end
