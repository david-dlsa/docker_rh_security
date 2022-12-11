class JobRolesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_adm?
  before_action :set_job_role, only: %i[ show edit update destroy ]

  # GET /job_roles or /job_roles.json
  def index
    @job_roles = JobRole.all
  end

  # GET /job_roles/1 or /job_roles/1.json
  def show
  end

  # GET /job_roles/new
  def new
    @job_role = JobRole.new
  end

  # GET /job_roles/1/edit
  def edit
  end

  # POST /job_roles or /job_roles.json
  def create
    @job_role = JobRole.new(job_role_params)

    respond_to do |format|
      if @job_role.save
        format.html { redirect_to @job_role, notice: "Job role was successfully created." }
        format.json { render :show, status: :created, location: @job_role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_roles/1 or /job_roles/1.json
  def update
    respond_to do |format|
      if @job_role.update(job_role_params)
        format.html { redirect_to @job_role, notice: "Job role was successfully updated." }
        format.json { render :show, status: :ok, location: @job_role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_roles/1 or /job_roles/1.json
  def destroy
    @job_role.destroy
    respond_to do |format|
      format.html { redirect_to job_roles_url, notice: "Job role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_role
      @job_role = JobRole.find_by(id: params[:id])
      self.send_error_info unless @job_role.present?
    end

    # Only allow a list of trusted parameters through.
    def job_role_params
      params.require(:job_role).permit(:title)
    end
end
