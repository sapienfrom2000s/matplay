require 'rails_helper'

RSpec.describe "Matrix", type: :system do
  describe "multiplication" do
    it "gives product of A.B" do
      visit new_matrix_calculator_path

      fill_in 'row-A', with: 4
      fill_in 'column-A', with: 2

      fill_in 'row-B', with: 2
      fill_in 'column-B', with: 3

      click_button 'Generate Template'
      
      fill_in 'matrix_A-1-1', with: 3
      fill_in 'matrix_A-1-2', with: 2
      fill_in 'matrix_A-2-1', with: 5
      fill_in 'matrix_A-2-2', with: 3
      fill_in 'matrix_A-3-1', with: 7
      fill_in 'matrix_A-3-2', with: 3
      fill_in 'matrix_A-4-1', with: 1
      fill_in 'matrix_A-4-2', with: 0

      fill_in 'matrix_B-1-1', with: 9
      fill_in 'matrix_B-1-2', with: 0
      fill_in 'matrix_B-1-3', with: 2
      fill_in 'matrix_B-2-1', with: 0
      fill_in 'matrix_B-2-2', with: 7
      fill_in 'matrix_B-2-3', with: 0

      click_button 'Multiply'
      expect(page).to have_content('27 14 6').and have_content('45 21 10')
      .and have_content('63 21 14').and have_content('9 0 2')
    end
  end
end
