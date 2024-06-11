class Api::V1::NotesController < ApplicationController
  before_action :set_patient, only: [:recent_notes, :create_note]

  def recent_notes
    @recent_notes = @patient.notes.where('created_at >= ?', 2.weeks.ago)
    render json: @recent_notes
  end

  def create_note
    @note = @patient.notes.build(note_params)
    puts @note
    if @patient.save
      render json: @note, status: :created
    else
      render json: { message: @note.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Patient not found" }, status: :not_found
  end

  def note_params
    params.permit(:note, :user_id)
  end
end