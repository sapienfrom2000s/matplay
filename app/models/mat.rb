require 'matrix'

class Mat
  def self.form(name, values, rows, columns)
    n_array = Array.new(rows) {Array.new(columns)}
    (1..rows).each do |row|
      (1..columns).each do |column|
        n_array[row-1][column-1] = values["#{name}-#{row}-#{column}".to_sym].to_i
      end
    end
    Matrix[*n_array]
  end

  def self.product(a, b)
    a*b
  end
end