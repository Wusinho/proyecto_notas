require 'rails_helper'

RSpec.describe NotesController, type: :request do
  describe "POST #create" do
    context "when user is signed in" do
      let(:user) { FactoryBot.create(:user) }
      let(:note_params) { FactoryBot.attributes_for(:note) }

      before do
        sign_in user
      end

      it "creates a new note" do
        expect {
          post notes_path, params: { note: note_params }
        }.to change(Note, :count).by(1)
      end

      it "returns a successful response" do
        post notes_path, params: { note: note_params }
        expect(response).to be_successful
      end

      it "returns the correct turbo stream responses" do
        post notes_path, params: { note: note_params }

        expect(response.body).to include('turbo-stream')
        expect(response.body).to include('notes')
        expect(response.body).to include('note_form')

        expect(response.body).to include("prepend", "notes")
        expect(response.body).to include("replace", "note_form")
      end

      it "renders the error message when it does not pass validations" do
        post notes_path, params: { note: { title: "Only Title" } }

        expect(response.body).to include('error_message')
        expect(response.body).to include("Body can&#39;t be blank and Note date can&#39;t be blank")
      end
    end

    context "when user is not signed in" do
      let(:note_params) { FactoryBot.attributes_for(:note) }

      it "redirects to sign in page" do
        post notes_path, params: { note: note_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "PATCH /notes/:id" do
    context "when user is authenticated" do
      let(:user) { create(:user) }
      let(:note) { create(:note, user: user) }
      before do
        sign_in user
      end

      context "with valid params" do
        it "updates the note" do
          patch note_path(note), params: { note: { title: "Updated Title" } }
          expect(note.reload.title).to eq("Updated Title")
        end

      end

      context "with invalid params" do
        it "renders the error message" do
          patch note_path(note), params: { note: { title: "" } }
          expect(response.body).to include('error_message')
          expect(response.body).to include("Title can&#39;t be blank")
        end
      end
    end
    end
end
