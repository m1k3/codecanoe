class BuildConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app
  before_action :set_build_configuration, only: [:edit, :update, :destroy]

  # GET /build_configurations/new
  def new
    @build_configuration = @app.build_configurations.new
  end

  # GET /build_configurations/1/edit
  def edit
  end

  # POST /build_configurations
  # POST /build_configurations.json
  def create
    @build_configuration = @app.build_configurations.new(build_configuration_params)

    respond_to do |format|
      if @build_configuration.save
        format.html { redirect_to app_path(@app), notice: 'Build configuration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @build_configuration }
      else
        format.html { render action: 'new' }
        format.json { render json: @build_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /build_configurations/1
  # PATCH/PUT /build_configurations/1.json
  def update
    respond_to do |format|
      if @build_configuration.update(build_configuration_params)
        format.html { redirect_to app_path(@app), notice: 'Build configuration was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @build_configuration }
      else
        format.html { render action: 'edit' }
        format.json { render json: @build_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /build_configurations/1
  # DELETE /build_configurations/1.json
  def destroy
    @build_configuration.destroy
    respond_to do |format|
      format.html { redirect_to build_configurations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build_configuration
      @build_configuration = @app.build_configurations.find(params[:id])
    end
    def set_app
      @app = current_user.apps.find(params[:app_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def build_configuration_params
      params.require(:build_configuration).permit(:name, :commands)
    end
end
