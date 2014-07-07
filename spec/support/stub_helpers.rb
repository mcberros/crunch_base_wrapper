module StubHelpers
  def stub_one_company_page
	  stub_request(:get, "http://api.crunchbase.com/v/2/organizations?order=created_at%20DESC&page=1&user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => organizations_only_one_company_page_response)
	end

	def stub_one_company
  stub_request(:get, "http://api.crunchbase.com/v/2/organization/keen?user_key=e314b958fbba5e68116283cf9f8cd96e").
    to_return(:status => 200, :body => company_keen_response)
	end

	def stub_three_company_pages
	  stub_request(:get, "http://api.crunchbase.com/v/2/organizations?order=created_at%20DESC&page=1&user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => organizations_three_company_pages_response)
	end

	def stub_each_company_for_the_first_page
	  companies_data = JSON.parse(organizations_three_company_pages_response)
	  companies_data['data']['items'].each do |company|
	    stub_request(:get, "http://api.crunchbase.com/v/2/#{company['path']}?user_key=e314b958fbba5e68116283cf9f8cd96e").
	      to_return(:status => 200, :body => company_keen_response)
	  end
	end

	def organizations_only_one_company_page_response
	  <<-JSON
	    {
			 "data": {
					  "items": [
							   {
							    "name": "Keen IO",
							    "path": "organization/keen"
							   }
							  ],
					  "paging": {
					   		"total_items": 1
					  	}
					  }
			 	}
	  JSON
	end

	def company_keen_response
	  <<-JSON
	    {
	    "metadata": {
	        "version": 2,
	        "www_path_prefix": "http://www.crunchbase.com/",
	        "api_path_prefix": "http://api.crunchbase.com/v/2/",
	        "image_path_prefix": "http://images.crunchbase.com/"
	    },
	    "data": {
	        "uuid": "eac4a68e03ffe3ac8cfbafba249d4f0f",
	        "type": "Organization",
	        "properties": {
	            "role_company": true,
	            "email_address": "team@keen.io",
	            "description": "The custom analytics backend for modern developers.",
	            "short_description": "Keen IO is a custom analytics back-end for modern developers.",
	            "founded_on_day": 1,
	            "founded_on_month": 12,
	            "founded_on_year": 2011,
	            "founded_on": "2011-12-01",
	            "founded_on_trust_code": 6,
	            "permalink": "keen",
	            "primary_role": "company",
	            "is_closed": false,
	            "closed_on_trust_code": 0,
	            "homepage_url": "http://keen.io",
	            "name": "Keen IO",
	            "closed_on_day": null,
	            "closed_on_month": null,
	            "closed_on_year": null,
	            "closed_on": null,
	            "created_at": 1321707389,
	            "updated_at": 1404239051,
	            "total_funding_usd": 14518000,
	            "number_of_investments": 0,
	            "number_of_employees": 5
	        },
	        "relationships": {
	            "board_members_and_advisors": {
	                "paging": {
	                    "total_items": 1,
	                    "first_page_url": "http://api.crunchbase.com/v/2/organization/keen/board_members_and_advisors",
	                    "sort_order": "created_at DESC"
	                },
	                "items": [
	                    {
	                        "first_name": "Sunil",
	                        "last_name": "Dhaliwal",
	                        "title": "Board Member",
	                        "started_on": "2013-11-05",
	                        "path": "person/sunil-dhaliwal",
	                        "created_at": 1243378434,
	                        "updated_at": 1398010531
	                    }
	                ]
	            },
	            "current_team": {
	                "paging": {
	                    "total_items": 11,
	                    "first_page_url": "http://api.crunchbase.com/v/2/organization/keen/current_team",
	                    "sort_order": "custom"
	                },
	                "items": [
	                    {
	                        "first_name": "Josh",
	                        "last_name": "Dzielak",
	                        "title": "VP Engineering",
	                        "started_on": "2013-01-02",
	                        "path": "person/josh-dzielak",
	                        "created_at": 1320925510,
	                        "updated_at": 1397989665
	                    },
	                    {
	                        "first_name": "Caroline",
	                        "last_name": "Fernandes",
	                        "title": "Director of Biz Dev & Sales",
	                        "started_on": "2014-01-01",
	                        "path": "person/caroline-fernandes",
	                        "created_at": 1391590397,
	                        "updated_at": 1397989723
	                    },
	                    {
	                        "first_name": "Justin",
	                        "last_name": "Johnson",
	                        "title": "VP, Developer Advocacy",
	                        "started_on": "2013-10-03",
	                        "path": "person/justin-johnson",
	                        "created_at": 1329971778,
	                        "updated_at": 1403154350
	                    },
	                    {
	                        "first_name": "Justin",
	                        "last_name": "Johnson",
	                        "title": "Director, Developer Advocacy",
	                        "started_on": "2013-09-01",
	                        "path": "person/justin-johnson",
	                        "created_at": 1329971778,
	                        "updated_at": 1403154350
	                    },
	                    {
	                        "first_name": "Dan",
	                        "last_name": "Kador",
	                        "title": "Founder, CTO",
	                        "started_on": "2012-01-01",
	                        "path": "person/dan-kador",
	                        "created_at": 1321707388,
	                        "updated_at": 1397989099
	                    },
	                    {
	                        "first_name": "Nick",
	                        "last_name": "Lashinsky",
	                        "title": "Director of Business Development",
	                        "started_on": "2013-07-01",
	                        "path": "person/nick-lashinsky",
	                        "created_at": 1373616316,
	                        "updated_at": 1397989667
	                    },
	                    {
	                        "first_name": "Pejman",
	                        "last_name": "Nozad",
	                        "title": "Investor",
	                        "started_on": null,
	                        "path": "person/pejman-nozad",
	                        "created_at": 1194033250,
	                        "updated_at": 1398010592
	                    },
	                    {
	                        "first_name": "Ryan",
	                        "last_name": "Spraetz",
	                        "title": "Founder, Chief Product Officer",
	                        "started_on": "2012-01-01",
	                        "path": "person/ryan-spraetz",
	                        "created_at": 1313586045,
	                        "updated_at": 1397989503
	                    }
	                ]
	            },
	            "primary_image": {
	                "paging": {
	                    "total_items": 1,
	                    "first_page_url": "http://api.crunchbase.com/v/2/organization/keen/primary_image",
	                    "sort_order": "created_at DESC"
	                },
	                "items": [
	                    {
	                        "type": "ImageAsset",
	                        "title": null,
	                        "path": "image/upload/v1400830084/ilr98wo5wofhvitgvzja.jpg",
	                        "created_at": 1398018951,
	                        "updated_at": 1400830093
	                    }
	                ]
	            },
	            "images": {
	                "paging": {
	                    "total_items": 1,
	                    "first_page_url": "http://api.crunchbase.com/v/2/organization/keen/images",
	                    "sort_order": "created_at DESC"
	                },
	                "items": [
	                    {
	                        "type": "ImageAsset",
	                        "title": null,
	                        "path": "image/upload/v1397181791/9110e3e99c8f56340d2f7ea0452032c7.png",
	                        "created_at": 1398018951,
	                        "updated_at": 1398018951
	                    }
	                ]
	            }
	        }
	    }
	}
	JSON
	end

	def organizations_three_company_pages_response
	  <<-JSON
	      {
	        "data": {
	            "items": [
	                {
	                    "updated_at": 1404662294,
	                    "name": "Bric",
	                    "path": "organization/bric",
	                    "created_at": 1404662292,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404661666,
	                    "name": "Grafyt",
	                    "path": "organization/grafyt",
	                    "created_at": 1404661288,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404660168,
	                    "name": "Baltimore Bitcoin Association",
	                    "path": "organization/baltimore-bitcoin-association",
	                    "created_at": 1404660010,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404659790,
	                    "name": "Wervetu",
	                    "path": "organization/wervetu",
	                    "created_at": 1404659789,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404659469,
	                    "name": "Bitsie",
	                    "path": "organization/bitsie",
	                    "created_at": 1404659377,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404660908,
	                    "name": "Viper Networks",
	                    "path": "organization/viper-networks",
	                    "created_at": 1404659241,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404658061,
	                    "name": "Smith Village Home Furnishings",
	                    "path": "organization/smith-village-home-furnishings",
	                    "created_at": 1404657952,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404661690,
	                    "name": "nFocus Labs",
	                    "path": "organization/nfocus-labs",
	                    "created_at": 1404657255,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404656343,
	                    "name": "Pricetree",
	                    "path": "organization/pricetree",
	                    "created_at": 1404656137,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404656312,
	                    "name": "D.C. Media Networks GmbH",
	                    "path": "organization/d-c-media-networks-gmbh",
	                    "created_at": 1404655742,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404654042,
	                    "name": "Roundtable",
	                    "path": "organization/roundtable",
	                    "created_at": 1404654042,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404653984,
	                    "name": "Gopalkrishnaa D",
	                    "path": "organization/gopalkrishnaa-d",
	                    "created_at": 1404653983,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404655121,
	                    "name": "Credit Card Helpdesk",
	                    "path": "organization/credit-card-helpdesk",
	                    "created_at": 1404653671,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404652229,
	                    "name": "EunJi Hyun",
	                    "path": "organization/eunji-hyun",
	                    "created_at": 1404652229,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404649799,
	                    "name": "Monkimun",
	                    "path": "organization/monkimun",
	                    "created_at": 1404649798,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404645961,
	                    "name": "Fortnight Solutions",
	                    "path": "organization/fortnight-solutions",
	                    "created_at": 1404645960,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404645891,
	                    "name": "Los Gatos Research",
	                    "path": "organization/los-gatos-research",
	                    "created_at": 1404645891,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404648274,
	                    "name": "BodyWise",
	                    "path": "organization/bodywise",
	                    "created_at": 1404645604,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404644885,
	                    "name": "MRSjimmvinnburr",
	                    "path": "organization/mrsjimmvinnburr",
	                    "created_at": 1404644805,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404644645,
	                    "name": "ExtendTV",
	                    "path": "organization/extendtv",
	                    "created_at": 1404644645,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404644320,
	                    "name": "Creative Visions Foundation",
	                    "path": "organization/creative-visions-foundation",
	                    "created_at": 1404644263,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404643817,
	                    "name": "Appknox",
	                    "path": "organization/appknox",
	                    "created_at": 1404643613,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404643423,
	                    "name": "Univcritique",
	                    "path": "organization/univcritique",
	                    "created_at": 1404643384,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404643511,
	                    "name": "MOBADVANCE",
	                    "path": "organization/mobadvance",
	                    "created_at": 1404641840,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404640403,
	                    "name": "ActionFinish",
	                    "path": "organization/actionfinish",
	                    "created_at": 1404640396,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404640093,
	                    "name": "Consumer Financial Protection Bureau",
	                    "path": "organization/consumer-financial-protection-bureau",
	                    "created_at": 1404640093,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404639740,
	                    "name": "Multiple Myeloma Research Foundation",
	                    "path": "organization/multiple-myeloma-research-foundation",
	                    "created_at": 1404639739,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404639611,
	                    "name": "Friends of Cancer Research",
	                    "path": "organization/friends-of-cancer-research",
	                    "created_at": 1404639611,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404639569,
	                    "name": "Foundation for the National Institutes of Health",
	                    "path": "organization/foundation-for-the-national-institutes-of-health",
	                    "created_at": 1404639569,
	                    "type": "Organization"
	                },
	                {
	                    "updated_at": 1404639511,
	                    "name": "Citizens United for Research in Epilepsy",
	                    "path": "organization/citizens-united-for-research-in-epilepsy",
	                    "created_at": 1404639511,
	                    "type": "Organization"
	                }
	            ],
	            "paging": {
	                "next_page_url": "http://api.crunchbase.com/v/2/organizations?page=2",
	                "total_items": 30,
	                "number_of_pages": 1,
	                "sort_order": "created_at DESC",
	                "items_per_page": 1000,
	                "prev_page_url": null,
	                "current_page": 1
	            }
	        },
	        "metadata": {
	            "image_path_prefix": "http://images.crunchbase.com/",
	            "www_path_prefix": "http://www.crunchbase.com/",
	            "api_path_prefix": "http://api.crunchbase.com/v/2/",
	            "version": 2
	        }
	    }
	  JSON
	end
end

RSpec.configure do |c|
  c.include StubHelpers
end