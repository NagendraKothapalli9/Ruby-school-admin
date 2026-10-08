class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :age, :course)
  end
end