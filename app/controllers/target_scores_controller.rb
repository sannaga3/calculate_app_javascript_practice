class TargetScoresController < ApplicationController
  before_action :set_target_score, only: %i[ show edit update destroy ]

  # GET /target_scores or /target_scores.json
  def index
    @target_scores = TargetScore.all
  end

  # GET /target_scores/1 or /target_scores/1.json
  def show
  end

  # GET /target_scores/new
  def new
    @students = Student.all
    @target_score = TargetScore.new
  end

  # GET /target_scores/1/edit
  def edit
    @students = Student.all
  end

  # POST /target_scores or /target_scores.json
  def create
    # binding.irb
    @target_score = TargetScore.new
    @students = Student.all
    respond_to do |format|
      if @target_score.save
        format.html { redirect_to @target_score, notice: "Target score was successfully created." }
        format.json { render :show, status: :created, location: @target_score }
        # format.json { binding.irb }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @target_score.errors, status: :unprocessable_entity }
        # format.json { binding.irb }
        # format.js { render json: @target_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /target_scores/1 or /target_scores/1.json
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

  # DELETE /target_scores/1 or /target_scores/1.json
  def destroy
    @target_score.destroy
    respond_to do |format|
      format.html { redirect_to target_scores_url, notice: "Target score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_score
      @target_score = TargetScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def target_score_params
      params.require(:target_score).permit(:math, :english, :science, :student_id)
    end
end
