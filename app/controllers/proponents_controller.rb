class ProponentsController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_proponent, only: %i[ show edit update destroy ]

  def index
    @proponents = Proponent.all
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
    if @proponent.save
      redirect_to @proponent, notice: "Proponent was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @proponent.update(proponent_params)
      redirect_to @proponent, notice: "Proponent was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

 
  # DELETE /proponents/1 or /proponents/1.json
  def destroy
    @proponent.destroy
    redirect_to proponents_url, notice: "Proponent was successfully destroyed." 
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  

  # Only allow a list of trusted parameters through.
  def proponent_params
    params.require(:proponent)
          .permit(:full_name, :cpf, :birth_date, :personal_phone, 
                  :reference_phone, :salary, :discount_inss, 
                  address_attributes: [:id, :zip_code, :public_place, :complement, :district, :city, :uf])
  end
end