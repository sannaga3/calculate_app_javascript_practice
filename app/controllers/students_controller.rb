class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @form = Form::StudentCollection.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    # @student = Student.new(student_params)

    # paramsからstudentを個別に取り出し@studentsとして登録する → @studentsにsaveができない
    # instances = params[:student].values.count
    # @students =[]
    # instances.times do
    #   @student = Student.new(student_params)
    #   @students << @student
    # end

    
    # instances = params[:student].values.count
    # instances.times do
    #   @student = Student.new(student_params)
    # end

    # paramから＠studentを作成して登録までの流れを２.times行う　→ ダブルレンダーのエラーが回避できない
    # instances = params[:student].values.count
    # instances.times do
    #   @student = Student.new(student_params)
    # end
    # respond_to do |format|
    #   if @student.save
    #     format.html { redirect_to @student, notice: "Student was successfully created." }
    #     format.json { render :show, status: :created, location: @student }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @student.errors, status: :unprocessable_entity }
    #   end
    # end

    @form = Form::StudentCollection.new(student_collection_params)
    if @form.save
      redirect_to students_path, notice: "生徒を登録しました"
    else
      flash.now[:alert] = "生徒の登録に失敗しました"
      render :new
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
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

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name)
    end

    def student_collection_params
      params.require(:form_student_collection)
      .permit(students_attributes: [:id, :name])
    end
end
