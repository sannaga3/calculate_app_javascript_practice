class TargetScoresController < ApplicationController
  before_action :set_target_score, only: %i[ show edit update destroy ]

  def index
    @target_scores = TargetScore.all
  end

  def show
  end

  def new
    @students = Student.all
    @target_score = TargetScore.new
  end

  def edit
    @students = Student.all
  end

  def create
    @target_score = TargetScore.new(target_score_params)
    @students = Student.all
    respond_to do |format|
      if @target_score.save
        format.html { redirect_to @target_score, notice: "Target score was successfully created." }
        format.json { render :show, status: :created, location: @target_score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @target_score.errors, status: 404 }
        # format.json { render :show, status: :created, location: @target_score }
      end
    end
  end

  def update
    respond_to do |format|
      if @target_score.update(target_score_params)
        format.html { redirect_to @target_score, notice: "Target score was successfully updated." }
        format.json { render :show, status: :ok, location: @target_score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @target_score.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @target_score.destroy
    respond_to do |format|
      format.html { redirect_to target_scores_url, notice: "Target score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_target_score
      @target_score = TargetScore.find(params[:id])
    end

    def target_score_params
      params.require(:target_score).permit(:math, :english, :science, :student_id)
    end
end
