require 'spec_helper'

describe 'dashboard' do

	context 'with only one page of companies and products' do
		it 'No Prev or Next' do
			stub_one_company_page

			stub_one_company

			stub_one_product_page

			stub_one_product

			visit '/dashboard'

			expect(page).to have_content("Keen IO")
			expect(page).to have_content("Keen IO is a custom analytics back-end for modern developers.")
			expect(page).to have_content("Basecamp")
			expect(page).to have_content("Basecamp is a project management ")
			expect(page).not_to have_content("Prev")
			expect(page).not_to have_content("Next")
		end
	end

	context 'with only one page of companies and product. The only company does not have board members' do
		it 'shows company' do
			stub_one_company_page_without_board

			stub_one_company_without_board

			stub_one_product_page

			stub_one_product

			visit '/dashboard'

			expect(page).to have_content("Home Inventory S[pecialists")
		end
	end

	context 'with three pages of companies' do

		before(:each) do
			stub_three_company_pages

			stub_each_company_for_the_first_page

			stub_one_product_page

			stub_one_product
		end

		it 'first page only sees Next' do
			visit '/dashboard'

			expect(page).not_to have_content('Prev')
			expect(page).to have_content('Next')
		end

		it 'second page sees Prev and Next' do
			visit '/dashboard?page_companies=2&page_products=1'

			expect(page).to have_content('Prev')
			expect(page).to have_content('Next')
		end

		it 'thirsd page sees only Prev' do
			visit '/dashboard?page_companies=3&page_products=1'

			expect(page).to have_content('Prev')
			expect(page).not_to have_content('Next')
		end
	end

	context 'with three pages of products' do

		before(:each) do
			stub_one_company_page

			stub_one_company

			stub_three_product_pages

			stub_each_product_for_the_first_page
		end

		it 'first page only sees Next' do
			visit '/dashboard'

			expect(page).not_to have_content('Prev')
			expect(page).to have_content('Next')
		end

		it 'second page sees Prev and Next' do
			visit '/dashboard?page_companies=1&page_products=2'

			expect(page).to have_content('Prev')
			expect(page).to have_content('Next')
		end

		it 'thirsd page sees only Prev' do
			visit '/dashboard?page_companies=1&page_products=3'

			expect(page).to have_content('Prev')
			expect(page).not_to have_content('Next')
		end
	end
end