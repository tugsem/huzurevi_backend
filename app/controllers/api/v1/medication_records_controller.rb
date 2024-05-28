class Api::V1::MedicationRecordsController < ApplicationController
  before_action :set_medication_record, only: %i[ show update destroy ]

  # GET /medication_records
  def index
    @medication_records = MedicationRecord.all

    render json: @medication_records
  end

  # GET /medication_records/1
  def show
    render json: @medication_record
  end

  # POST /medication_records
  def create
    @medication_record = MedicationRecord.new(medication_record_params)

    if @medication_record.save
      render json: @medication_record, status: :created
    else
      render json: { errors: @medication_record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medication_records/1
  def update
    if @medication_record.update(medication_record_params)
      render json: @medication_record
    else
      render json: @medication_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medication_records/1
  def destroy
    @medication_record.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication_record
      @medication_record = MedicationRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medication_record_params
      params.require(:medication_record).permit(:patient_id, :nurse_id, :medication_name, :dosage, :administration_time, :note)
    end
end
