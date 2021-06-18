class CalculatesController < ApplicationController
  def calculate
    contribuiton_caculated = CalculatorService.new(params[:salary].to_f).execute!
    respond_to do |format|
      format.json { render json: { contribuition: contribuiton_caculated }, status: 200}
    end
  end
end