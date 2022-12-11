class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_adm?
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :job_role_title, only: %i[index new create edit update]
  before_action :workspace_title, only: %i[index new create edit update]

  # GET /people or /people.json
  def index
    @people = Person.all
    @people = @people.where(("description like '%#{params[:search]}%'")).or(Person.where("cast(registration as text) like '%#{params[:search]}%'")) if params[:search].present?
    @people = @people.where(workspace_id: params[:search_workspace]) if params[:search_workspace].present?
    @people = @people.where(job_role_id: params[:search_job_role]) if params[:search_job_role].present?
    @people = @people.where(sex: params[:search_sex]) if params[:search_sex].present?
    @people = @people.order(:description)
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find_by(id: params[:id])
      @contacts = Contact.where(person_id: params[:id]).paginate(page: params[:page], per_page: 5)
      self.send_error_info unless @person.present?

    end

    def job_role_title
      @job_role_title = JobRole.all.pluck(:title, :id)
    end

    def workspace_title
      @workspace_title = Workspace.all.pluck(:title, :id)
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:description, :registration, :birth_date, :birth_county, :birth_state, :marital_status, :sex, :workspace_id, :job_role_id,
      contacts_attributes: [:id, :telephone, :cell_phone, :email, :_destroy])
    end
end
