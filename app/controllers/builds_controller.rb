class BuildsController < ApplicationController
  # FIXME: authorize this so that it can be called only from the build infrastructure
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
end
