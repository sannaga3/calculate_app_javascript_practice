class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @form = Form::StudentCollection.new
  end

  def edit
  end

  def create
    @form = Form::StudentCollection.new(student_collection_params)
    if @form.save
      redirect_to students_path, notice: "生徒を登録しました"
    else
      flash.now[:alert] = "生徒の登録に失敗しました"
      render :new
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name)
    end

    def student_collection_params
      params.require(:form_student_collection).permit(students_attributes: [:id, :name])
    end
end
