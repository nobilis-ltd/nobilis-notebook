class NotesController < ApplicationController
  def index
    require_user
  end
end
