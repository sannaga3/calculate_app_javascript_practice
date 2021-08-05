class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: %i[ show edit update destroy ]

  def index
    @curriculums = Curriculum.includes(:student)
  end

  def show
  end

  def new
    @students = Student.all
    @curriculum = Curriculum.new
    @curriculum.double_checks.build
  end

  def edit
    @students = Student.all
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    @students = Student.all
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to @curriculum, notice: "Curriculum was successfully created." }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @students = Student.all
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: "Curriculum was successfully updated." }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @curriculum.destroy
    respond_to do |format|
      format.html { redirect_to curriculums_url, notice: "Curriculum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def average_ranking
    @average_score_list = Curriculum.order(average_score: :desc).limit(5).pluck(:student_id ,:average_score)
    @average_score_list.map! do |k, v|
      [Student.find_by(id: k).name, v]
    end
  end

  def math_ranking
    @math_score_list = Curriculum.order(math: :desc).limit(5).pluck(:student_id ,:math)
    @math_score_list.map! do |k, v|
      [Student.find_by(id: k).name, v]
    end
  end

  private
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    def curriculum_params
      params.require(:curriculum).permit(:math, :english, :science, :total_score, :average_score, :grade, :remarks, :student_id,
        double_checks_attributes:
        [:id, :teacher_name, :check, :comment, :curriculum_id, :_destroy]
      )
    end
end
