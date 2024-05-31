class Api::V1::PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show update destroy recent_notes create_note ]
  include NameCapitalization
  # GET /patients
  def index
    @patients = Patient.all

    render json: @patients
  end

  # GET /patients/1
  def show
    render json: @patient
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: @patient, status: :created
    else
      render json: @patient.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      render json: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy!
  end

  def recent_notes
    @recent_notes = @patient.notes.where('created_at >= ?', 2.weeks.ago)
    render json: @recent_notes
  end

  def create_note
    @note = @patient.notes.new(note_params)
    if @note.save
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(
        :first_name,
        :last_name,
        :date_of_birth,
        :gender,
        :contact_number,
        :email,
        :address,
        :medical_history,
        :medications,
        :assigned_nurse_id,
        :room_number,
        :status
      )
  end

  def note_params
    params.require(:note).permit(:note, :patient_id, :nurse_id)
  end

end
