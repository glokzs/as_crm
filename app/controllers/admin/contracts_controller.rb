# frozen_string_literal: true

class Admin::ContractsController < Admin::AdminController
  def new; end

  def create
    @contract = Contract.new(contract_params)
    @contract[:date] = Date.today
    @contract[:student_id] = params[:student_id]
    @contract.save
    redirect_to admin_students_path
  end

  def show
    @contract = Contract.find(params[:id])
    @template = Template.first
    @requisite = Requisite.first
    respond_to do |format|
      format.pdf do
        pdf = Admin::ContractPdf.new(@contract, @template, @requisite)
        send_data pdf.render, filename: 'contract.pdf', type: 'application/pdf'
      end
    end
  end

  private

  def contract_params
    params.permit(:student_id, :date)
  end
end