class BuildsController < ApplicationController
  before_filter :restrict_access
  before_action :set_build

  def success
    if @build.succeeded!
      BuildNotifications.status(@build).deliver
      head :ok
    end
  end

  def fail
    if @build.failed!
      BuildNotifications.status(@build).deliver
      head :ok
    end
  end

  private
    def set_build
      @build = Build.find(params[:id])
    end
    def restrict_access
      head :unauthorized unless params[:access_token] == Rails.application.secrets.build_api_token
    end
end
