class MovimientosDeBancosController < ApplicationController
  before_action :set_movimiento_de_banco, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_bancos
  # GET /movimientos_de_bancos.json
  def index
    @movimientos_de_bancos = MovimientoDeBanco.all
    @movimiento_de_banco = MovimientoDeBanco.new
    @movimiento_de_banco_detalle = MovimientoDeBancoDetalle.new
    @movimiento_de_banco.movimientos_de_bancos_detalles.build
  end

  # GET /movimientos_de_bancos/1
  # GET /movimientos_de_bancos/1.json
  def show
    @movimiento_de_banco_detalle = MovimientoDeBancoDetalle.new
    @movimientos_de_bancos_detalles = MovimientoDeBancoDetalle.all
  end

  # GET /movimientos_de_bancos/new
  def new
    @movimiento_de_banco = MovimientoDeBanco.new
  end

  # GET /movimientos_de_bancos/1/edit
  def edit
  end

  # POST /movimientos_de_bancos
  # POST /movimientos_de_bancos.json
  def create
    @movimiento_de_banco = MovimientoDeBanco.new(movimiento_de_banco_params)

    respond_to do |format|
      if @movimiento_de_banco.save
        format.html { redirect_to movimientos_de_bancos_url }
        format.json { render :show, status: :created, location: @movimiento_de_banco }
      else
        format.html { render :new }
        format.json { render json: @movimiento_de_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos_de_bancos/1
  # PATCH/PUT /movimientos_de_bancos/1.json
  def update
    respond_to do |format|
      if @movimiento_de_banco.update(movimiento_de_banco_params)
        format.html { redirect_to movimientos_de_bancos_url }
        format.json { render :show, status: :ok, location: @movimiento_de_banco }
      else
        format.html { render :edit }
        format.json { render json: @movimiento_de_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_de_bancos/1
  # DELETE /movimientos_de_bancos/1.json
  def destroy
    respond_to do |format|
      if @movimiento_de_banco.destroy
        format.html { redirect_to movimientos_de_bancos_url }
        format.json { head :no_content }
      else
        format.html { redirect_to movimientos_de_bancos_url, notice: 'No se puede eliminar.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_de_banco
      @movimiento_de_banco = MovimientoDeBanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_de_banco_params
      params.require(:movimiento_de_banco).permit(:total, :tipo_de_movimiento_id, :banco_id, :descripcion, :fecha, movimientos_de_bancos_detalles_attributes: [:id, :cuenta_bancaria_id, :descripcion, :monto])
    end
end
