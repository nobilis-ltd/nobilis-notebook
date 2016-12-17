class NotesController < ApplicationController
  def index
    require_user
  end

  def show
  end
end
