# frozen_string_literal: true

class HomePagesController < ApplicationController
  def index
    @welcome = 'Welcome to Proyecto Notas'
  end
end
