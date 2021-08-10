require 'time'
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
    # request =  JSON.parse(request.body.read, symbolize_name: true) #json形式のリクエストを表示
    # p request
    respond_to do |format|
      if @target_score.save
        @target_scores = TargetScore.pluck(:id, :math, :english, :science, :created_at)
        @target_scores.map! { |id, math, english, science, created_at|
          [id: id, math: math, english: english, science: science, created_at: created_at.to_i]
        }
        @target_scores = "data: #{@target_scores}"
        @target_scores = @target_scores.to_json
        format.json { render json: @target_scores, status: :ok }
        # 以下コメントアウトは勉強用メモ
        # @target_scores = @target_scores.to_json(only: [:id, :math, :english, :science, :created_at]) # renderの :except=> と同じ役割
        # format.json { render json: @target_scores, :except => [:student_id, :updated_at], status: :ok }¥
        # format.json { render :index, status: :created, location: @target_score }
      else
        format.json { render json: @target_score.errors, status: 404 }
        # format.json { render :show, status: :created, location: @target_score }
      end
    end
  end

  def update
    respond_to do |format|
      if @target_score.update(target_score_params)
        format.html { redirect_to @target_scores, notice: "Target score was successfully updated." }
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
