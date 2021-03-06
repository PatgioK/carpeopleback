class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  
  #skipping authentication for CRUD APP, normally would have but this app
  #has no login
  skip_before_action :verify_authenticity_token

  # GET /people or /people.json
  def index
    @people = Person.all

    render json: @people.to_json(include: :cars)
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
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
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
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
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
    # @cars = @person.cars
    # @cars.each do |car|
    #   car.destroy
    # end
    # @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      
      #changing default otherwise throw error to frontend when we del
      #format.json { head :no_content }
      
      format.json { render json: Person.all, status: :ok }
      # format.json { render json: @people.to_json(include: :cars), status: :ok }

    # render json: @people.to_json(include: :cars)

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:firstname, :lastname, :email, :id)
    end
end