class IbansController < ApplicationController
  def index
    ibans = Iban.all

    render json: ibans
  end

  def create
    Iban.create(iban_params)

    render json: 'Iban created successfully', status: :created
  end

  def show
    iban = Iban.find_by(name: params[:name])

    render json: iban
  end

  def update
    iban = Iban.find_by(name: params[:name])
    iban.update(name: params[:new_name])

    render json: 'Iban updated successfully'
  end

  def destroy
    Iban.find_by(name: params[:name]).destroy

    render json: 'Iban deleted successfully'
  end

  def random
    iban = Iban.all.sample

    render json: iban
  end

  private

  def iban_params
    params.permit(:name, :new_name)
  end
end
