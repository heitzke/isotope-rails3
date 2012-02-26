require 'open-uri'

class CommunityController < ApplicationController
  def index
  end

  def xrono
  end

  def rubyham
  end

  def techbirmingham
  end

  def get_github_project
    project = params[:project]
    github_url = "https://github.com/#{project}"
    render :text => open(github_url){ |f| f.read }
  end
  private
  def set_tab
    @tab = :community
  end
end
