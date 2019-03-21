# frozen_string_literal: true

class Admin::ContractsController < Admin::AdminController
  def new; end

  def create
    @contract = Contract.new(contract_params)
    @contract[:student_id] = params[:student_id]
    @contract[:number] = if Contract.last.nil?
                           1
                         else
                           Contract.last.number.to_i + 1
                         end
    if @contract.save
      redirect_to admin_students_path
    else
      redirect_to admin_students_path
    end
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
    params.permit(:student_id, :date, :number)
  end
end
