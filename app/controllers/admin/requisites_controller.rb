class Admin::RequisitesController < Admin::AdminController

  def index
  end

  def new
    @requisite = Requisite.new
  end

  def create
    @requisite = Requisite.new(requisite_params)
    if @requisite.save
      redirect_to admin_template_path(1)
    else
      render 'new'
    end
  end

  def edit
    @requisite = Requisite.find(params[:id])
  end

  def update
    @requisite = Requisite.find(params[:id])
    if @requisite.update(requisite_params)
      redirect_to admin_template_path(1)
    else
      render 'edit'
    end
  end

  private
  def requisite_params
    params.require(:requisite).permit(:owner, :address, :bin, :bank, :iik, :bik, :email, :web, :tel_1, :tel_2, :tel_3, :function, :fio, :based, :function_2, :fio_2)
  end
end
