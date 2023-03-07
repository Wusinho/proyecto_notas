# frozen_string_literal: true

class HomePagesController < ApplicationController
  before_action :set_note, only: [:show]
  def index
    @notes = Note.filter(params.slice(:sort_by_name))
  end

  def show; end

  private

  def set_note
    @note = Note.find(params[:id])
  end

end
