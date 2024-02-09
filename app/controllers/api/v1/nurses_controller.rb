class Api::V1::NursesController < ApplicationController
  before_action :set_nurse, only: %i[ show update destroy ]

  # GET /nurses
  def index
    @nurses = Nurse.all

    render json: @nurses
  end

  # GET /nurses/1
  def show
    render json: @nurse
  end

  # POST /nurses
  def create
    @nurse = Nurse.new(nurse_params)

    if @nurse.save
      render json: @nurse, status: :created, location: @nurse
    else
      render json: @nurse.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nurses/1
  def update
    if @nurse.update(nurse_params)
      render json: @nurse
    else
      render json: @nurse.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nurses/1
  def destroy
    @nurse.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nurse
      @nurse = Nurse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nurse_params
      params.require(:nurse).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :contact_number,
      :email,
      :username,
      :password,
      :password_confirmation
    )
    end
end
