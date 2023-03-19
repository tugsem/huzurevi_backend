class Api::V1::StockLogsController < ApplicationController
  before_action :set_stock_log, only: %i[ show update destroy ]

  # GET /stock_logs
  def index
    @stock_logs = StockLog.all.order(updated_at: :DESC)
    render json: @stock_logs
  end

  # GET /stock_logs/1
  def show
    render json: @stock_log
  end

  # POST /stock_logs
  def create

    @stock_log = StockLog.new(stock_log_params)
    @item = Stock.find(params[:stock_id])

    if params[:operation].to_i == 1
      @item.increment!(:quantity, params[:quantity].to_i)
    else
      @item.decrement!(:quantity, params[:quantity].to_i)
      @item.update(quantity: 0) if @item.quantity.negative?
    end

    if @stock_log.save
      render json: @stock_log, status: :created
    else
      render json: @stock_log.errors, status: :unprocessable_entity
    end
  end


  # DELETE /stock_logs/1
  def destroy
    @stock_log.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_stock_log
      @stock_log = StockLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_log_params
      params.require(:stock_log).permit(:stock_id, :stock_name, :quantity, :to_whom, :operation)
    end

end
