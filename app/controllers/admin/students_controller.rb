class Admin::StudentsController < Admin::AdminController

  def show
    @student = Student.find(params[:id])
  end

  def upload_picture
       @student.picture.attach(uploaded_file) if uploaded_file.present?
end

def uploaded_file
    params[:student][:pictures]
end

end
