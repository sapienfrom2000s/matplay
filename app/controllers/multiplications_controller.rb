class MultiplicationsController < ApplicationController
  before_action :set_multiplication, only: %i[ show edit update destroy ]

  # GET /multiplications or /multiplications.json
  def index
  end

  # GET /multiplications/1 or /multiplications/1.json
  def template
    @row_a = matrix_params['row-A'].to_i
    @row_b = matrix_params['row-B'].to_i
    
    @column_a = matrix_params['column-A'].to_i
    @column_b = matrix_params['column-B'].to_i
  end

  def result
  end

  # GET /multiplications/new
  def new
  end

  # GET /multiplications/1/edit
  def edit
  end

  # POST /multiplications or /multiplications.json
  def create
    @multiplication = Multiplication.new(multiplication_params)

    respond_to do |format|
      if @multiplication.save
        format.html { redirect_to multiplication_url(@multiplication), notice: "Multiplication was successfully created." }
        format.json { render :show, status: :created, location: @multiplication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multiplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiplications/1 or /multiplications/1.json
  def update
    respond_to do |format|
      if @multiplication.update(multiplication_params)
        format.html { redirect_to multiplication_url(@multiplication), notice: "Multiplication was successfully updated." }
        format.json { render :show, status: :ok, location: @multiplication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multiplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiplications/1 or /multiplications/1.json
  def destroy
    @multiplication.destroy!

    respond_to do |format|
      format.html { redirect_to multiplications_url, notice: "Multiplication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiplication
      @multiplication = Multiplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matrix_params
      params.permit('row-A', 'row-B', 'column-A', 'column-B')
    end
end