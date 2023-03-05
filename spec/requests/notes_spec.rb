require 'rails_helper'

RSpec.describe "Notes", type: :request do

  describe "GET /notes" do
    let(:user) { create(:user) }

    before { sign_in user }

    it "returns http success" do
      get notes_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post /notes" do
    let(:valid_attributes) { { title: '',
                               body: 'this is a body',
                               note_date: "2023-03-16" } }
    let(:user) { create(:user) }
    before { sign_in user }

    it "creates a new note" do
      expect {
        post notes_path, params: { note: valid_attributes }
      }.to change(Note, :count).by(1)
    end

    it "returns a Turbo Stream response" do
      post notes_path, params: { note: valid_attributes }

      expect(response).to have_stream_from("notes")
      expect(response).to have_stream_for(Note.last)
      expect(response.body).to include("New note")
      expect(response.body).to include("New content")
      expect(response.body).to include("note_form")
    end

    # it "returns http success" do
    #   params = {
    #     note: { title: 'test',
    #             body: 'this is a body',
    #             note_date: "2023-03-16"
    #     },
    #   }
    #   post '/notes', params: params
    #   expect(response).to have_stream_from("notes")
    #   # expect(response).to have_http_status(:created)
    # end
  end



end
