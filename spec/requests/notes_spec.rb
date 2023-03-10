# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

def partial_note(note)
  ApplicationController.render(partial: 'notes/note', locals: { note: note }).to_s
end

RSpec.describe NotesController, type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  describe 'GET #index' do
    context 'when user is signed in' do
      let!(:note) { create :note, title: 'aaaaaa', body: '1111', user:}
      let!(:note2) { create :note, title: 'cccc', body: '222', user: }
      let!(:note3) { create :note, title: 'zzz', body: '333', user: user2 }

      before do
        sign_in user
      end

      it 'should include all the current_user notes' do
        get notes_path
        card = partial_note(note)
        card2 = partial_note(note2)
        expect(response.body).to include(card)
        expect(response.body).to include(card2)
      end

      it 'should should not get other users notes' do
        get notes_path
        card = partial_note(note3)
        expect(response.body).not_to include(card)
      end

      it 'should not return a value if exist but its from another user' do
        get notes_path, params: { search: note3.title }
        card = partial_note(note3)
        # str = "class=\"text-decoration-none\" href=\"/notes/#{note3.id}\">#{note3.title}</a>\n "
        expect(response.body).not_to include(card)
      end

      it 'should return a value if exist and its from its owner' do
        get notes_path, params: { search: note2.title }
        card = partial_note(note2)
        expect(response.body).to include(card)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is signed in' do
      let(:note_params) { FactoryBot.attributes_for(:note) }

      before do
        sign_in user
      end

      it 'creates a new note' do
        expect do
          post notes_path, params: { note: note_params }
        end.to change(Note, :count).by(1)
      end

      it 'returns a successful response' do
        post notes_path, params: { note: note_params }
        expect(response).to be_successful
        note = Note.first
        card = partial_note(note)
        expect(response.body).to include(card)
      end

      it 'returns the correct turbo stream responses' do
        post notes_path, params: { note: note_params }

        expect(response.body).to include('turbo-stream')
        expect(response.body).to include('notes')
        expect(response.body).to include('note_form')

        expect(response.body).to include('prepend', 'notes')
        expect(response.body).to include('replace', 'note_form')
      end

      it 'renders the error message when it does not pass validations' do
        post notes_path, params: { note: { title: 'Only Title' } }

        expect(response.body).to include('error_message')
        expect(response.body).to include('Body can&#39;t be blank and Note date can&#39;t be blank')
      end
    end

    context 'when user is not signed in' do
      let(:note_params) { FactoryBot.attributes_for(:note) }

      it 'redirects to sign in page' do
        post notes_path, params: { note: note_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH /notes/:id' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let(:note) { create(:note, user:) }
      before do
        sign_in user
      end

      context 'with valid params' do
        it 'updates the note' do
          old_title = note.title

          patch note_path(note), params: { note: { title: 'Updated Title' } }
          expect(note.reload.title).to eq('Updated Title')
          expect(note.reload.title).not_to eq(old_title)
        end
      end

      context 'with invalid params' do
        it 'renders the error message' do
          patch note_path(note), params: { note: { title: '' } }

          expect(response.body).to include('error_message')
          expect(response.body).to include('Title can&#39;t be blank')
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
