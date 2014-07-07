require 'spec_helper'

describe 'company search' do
	it 'shows one company' do
		stub_one_company_page
		stub_one_company

		visit '/dashboard'

		fill_in('company_permalink', with: 'keen')

		click_button 'Search company'

		expect(page).to have_content('Name: Keen IO')
    expect(page).to have_content('Description: Keen IO is a custom analytics back-end for modern developers.')
    expect(page).to have_content('Description: Keen IO is a custom analytics back-end for modern developers.')
    expect(page).to have_content('Foundation date: 2011-12-01')
    expect(page).to have_content('Crunch Base URL: http://www.crunchbase.com/organization/keen')
    expect(page).to have_content('Title: Board Member')
    expect(page).to have_content('First Name: Sunil')
    expect(page).to have_content('Last Name: Dhaliwal')
    expect(page).to have_content('Crunch base URL: http://www.crunchbase.com/person/sunil-dhaliwal')
	end
end