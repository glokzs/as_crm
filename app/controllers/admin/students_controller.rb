class Admin::StudentsController < Admin::AdminController

  def show
    @student = Student.find(params[:id])
  end

   

end
