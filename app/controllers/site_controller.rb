class SiteController < ApplicationController
  layout 'site'
	layout 'one_page_app', only: [:app]

  def home
  end

	def app
	end
end
