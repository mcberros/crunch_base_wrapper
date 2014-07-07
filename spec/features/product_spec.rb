require 'spec_helper'

describe 'product search' do
	it 'shows one product' do
		stub_one_company_page

		stub_one_company

		stub_one_product_page

		stub_one_product

		visit '/dashboard'

		fill_in('product_permalink', with: 'basecamp')

		click_button 'Search product'

		expect(page).to have_content('Name: Basecamp')
    expect(page).to have_content('Description: Basecamp is a project management and group collaboration tool. It was launched in 2004 as 37signals first product. The tool includes')
    expect(page).to have_content('Crunch Base URL: http://www.crunchbase.com/product/basecamp')
    expect(page).to have_content("Title: Tom's Planner Acquires Gantt Chart Service Competitor Gantto")
    expect(page).to have_content('Author: Stephanie Yang')
    expect(page).to have_content('Posted on: 2013-07-09')
    expect(page).to have_content('Article URL: http://techcrunch.com/2013/07/09/toms-planner-acquires-gantt-chart-service-competitor-gantto/')
    expect(page).to have_content('Article URL', count: 5)

	end
end