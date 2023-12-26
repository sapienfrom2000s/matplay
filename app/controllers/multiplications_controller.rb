class MultiplicationsController < ApplicationController
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

  private
    def matrix_params
      params.permit('row-A', 'row-B', 'column-A', 'column-B')
    end
end
