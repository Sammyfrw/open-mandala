class TradeTypesController < ApplicationController
  before_action :set_trade_type, only: [:show, :edit, :update, :destroy]

  # GET /trade_types
  # GET /trade_types.json
  def index
    @trade_types = TradeType.all
  end

  # GET /trade_types/1
  # GET /trade_types/1.json
  def show
  end

  # GET /trade_types/new
  def new
    @trade_type = TradeType.new
  end

  # GET /trade_types/1/edit
  def edit
  end

  # POST /trade_types
  # POST /trade_types.json
  def create
    @trade_type = TradeType.new(trade_type_params)

    respond_to do |format|
      if @trade_type.save
        format.html { redirect_to @trade_type, notice: 'Trade type was successfully created.' }
        format.json { render :show, status: :created, location: @trade_type }
      else
        format.html { render :new }
        format.json { render json: @trade_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_types/1
  # PATCH/PUT /trade_types/1.json
  def update
    respond_to do |format|
      if @trade_type.update(trade_type_params)
        format.html { redirect_to @trade_type, notice: 'Trade type was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade_type }
      else
        format.html { render :edit }
        format.json { render json: @trade_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_types/1
  # DELETE /trade_types/1.json
  def destroy
    @trade_type.destroy
    respond_to do |format|
      format.html { redirect_to trade_types_url, notice: 'Trade type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade_type
      @trade_type = TradeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_type_params
      params.require(:trade_type).permit(:type_id, :group, :symbol_name, :description, :deposit_description, :withdrawal_description)
    end
end
