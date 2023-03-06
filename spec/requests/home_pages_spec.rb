# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomePagesController, type: :request do
  let!(:user) { create(:user) }
  let!(:notes) { create_list(:note, 5, user:) }

  describe 'GET #index' do
    it 'renders a successful response' do
      get home_pages_path
      expect(response).to have_http_status(:success)
      expect(Note.count).to equal(5)
      notes.each do |note|
        expect(response.body).to include(note.title)
        expect(response.body).to include(note.body)
        expect(response.body).to include(note.note_date)
      end
    end
  end

  describe 'GET #show' do

    it 'renders a successful response' do
      get home_page_path(notes.first)
      expect(response).to have_http_status(:success)
    end

    it 'displays the requested note' do
      get home_page_path(notes.first)
      expect(response.body).to include(notes.first.title)
    end

    it 'does not display other notes' do
      other_note = create(:note, user:)
      get home_page_path(notes.first)
      expect(response.body).to include(notes.first.title)
      expect(response.body).not_to include(other_note.title)
    end
  end
end
