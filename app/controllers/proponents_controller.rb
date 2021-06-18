class ProponentsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_employee!
  before_action :set_proponent, only: %i[ show edit update destroy ]
  layout "proponent"

  def index
    @search = Proponent.ransack(params[:q])
    @pagy, @proponents = pagy(@search.result)
  end

  def show
  end

  def new
    @proponent = Proponent.new
    @proponent.build_address
  end

  def edit
  end

  def create
    @proponent = Proponent.new(proponent_params)
    @proponent.contribution = CalculatorService.new(@proponent.salary).execute!
    if @proponent.save
      redirect_to @proponent, notice: "Proponent was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    @proponent.contribution = CalculatorService.new(proponent_params[:salary].to_f).execute!
    if @proponent.update(proponent_params)
      redirect_to @proponent, notice: "Proponent was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @proponent = Proponent.find(params[:id])
    @proponent.destroy

    respond_to do |format|
      format.html { redirect_to proponents_url, notice: "Proponent was successfully destroyed." }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
    
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  

  # Only allow a list of trusted parameters through.
  def proponent_params
    params.require(:proponent)
          .permit(:full_name, :cpf, :birth_date, :personal_phone, 
                  :reference_phone, :salary, :contribution, :email,
                  address_attributes: [:id, :zip_code, :public_place, :complement, :district, :city, :uf])
  end
end