class MatrixCalculatorController < ApplicationController
  def index; end

  def new; end
  def template
    @row_a = matrix_params['row-A'].to_i
    @row_b = matrix_params['row-B'].to_i

    @column_a = matrix_params['column-A'].to_i
    @column_b = matrix_params['column-B'].to_i
  end

  def multiply
    @matrix_a = MatrixedSystem.form('A', matrix_values, matrix_values[:row_a].to_i, matrix_values[:column_a].to_i)
    @matrix_b = MatrixedSystem.form('B', matrix_values, matrix_values[:row_b].to_i, matrix_values[:column_b].to_i)

    @matrix_c = MatrixedSystem.product(@matrix_a, @matrix_b)
  end

  private

  def matrix_params
    params.permit('row-A', 'row-B', 'column-A', 'column-B')
  end

  def matrix_values
    params.require(:matrix).permit!
  end
end
