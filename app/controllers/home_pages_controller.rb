# frozen_string_literal: true

class HomePagesController < ApplicationController
  before_action :set_note, only: [:show]
  before_action :selected_params, only: [:index]

  def index
    @notes = Note.filter(@selected_params)
  end

  def show; end

  private

  def set_note
    @note = Note.find(params[:id])
  end

end
