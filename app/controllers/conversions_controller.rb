class ConversionsController < ApplicationController
  def index; end

  def convert
    @conversion = Currency.convert_amount(conversion_params)

    respond_to do |format|
      format.js
    end
  end

  private

  def conversion_params
    params.permit(:amount, :currency)
  end
end
