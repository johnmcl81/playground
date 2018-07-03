class Level1sController < ApplicationController
  before_action :set_level1, only: [:show, :edit, :update, :destroy]

  # GET /level1s
  def index

    level1_1 = Level1.find_or_create_by(stage: 1)
    level1_1.input = level1_1.parse_input("level_1_input.txt")
    level1_1.result = level1_1.calc_total(1)
    level1_1.save

    level_2 = Level1.find_or_create_by(stage: 2)
    level_2.input = level_2.parse_input("level_1_input.txt")
    level_2.result = level1_1.calc_total
    level_2.save

    @level1s = Level1.all
  end

  # GET /level1s/1
  # GET /level1s/1.json
  def show
  end

  # GET /level1s/new
  def new
    @level1 = Level1.new
  end

  # GET /level1s/1/edit
  def edit
  end

  # POST /level1s
  # POST /level1s.json
  def create
    @level1 = Level1.new(level1_params)

    respond_to do |format|
      if @level1.save
        format.html { redirect_to @level1, notice: 'Level1 was successfully created.' }
        format.json { render :show, status: :created, location: @level1 }
      else
        format.html { render :new }
        format.json { render json: @level1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level1s/1
  # PATCH/PUT /level1s/1.json
  def update
    respond_to do |format|
      if @level1.update(level1_params)
        format.html { redirect_to @level1, notice: 'Level1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @level1 }
      else
        format.html { render :edit }
        format.json { render json: @level1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level1s/1
  # DELETE /level1s/1.json
  def destroy
    @level1.destroy
    respond_to do |format|
      format.html { redirect_to level1s_url, notice: 'Level1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level1
      @level1 = Level1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level1_params
      params.fetch(:level1, {})
    end
end
