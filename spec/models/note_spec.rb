require 'rails_helper'

RSpec.describe Note, type: :model do
  describe Note do
    context 'Note associations' do
      it do
        should belong_to(:user)
      end
    end
    context 'validations' do
      it do
        should validate_presence_of(:title)
        should validate_presence_of(:body)
        should validate_presence_of(:note_date)
      end
    end
  end
end
