module StubHelpers
  def stub_one_company_page
	  stub_request(:get, "http://api.crunchbase.com/v/2/organizations?order=created_at%20DESC&page=1&user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => organizations_only_one_company_page_response)
	end

	def stub_one_company
  stub_request(:get, "http://api.crunchbase.com/v/2/organization/keen?user_key=e314b958fbba5e68116283cf9f8cd96e").
    to_return(:status => 200, :body => company_keen_response)
	end

	def stub_one_company_page_without_board
	  stub_request(:get, "http://api.crunchbase.com/v/2/organizations?order=created_at%20DESC&page=1&user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => organizations_only_one_company_page_with_company_without_board_response)
	end

	def stub_one_company_without_board
  stub_request(:get, "http://api.crunchbase.com/v/2/organization/home-inventory-s-pecialists-llc?user_key=e314b958fbba5e68116283cf9f8cd96e").
    to_return(:status => 200, :body => company_without_board)
	end

	def stub_one_product_page
	  stub_request(:get, "http://api.crunchbase.com/v/2/products?order=created_at%20DESC&page=1&user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => organizations_only_one_product_page_response)
	end

	def stub_one_product
	  stub_request(:get, "http://api.crunchbase.com/v/2/product/basecamp?user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => product_basecamp_response, :headers => {})
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

	def stub_three_product_pages
	  stub_request(:get, "http://api.crunchbase.com/v/2/products?order=created_at%20DESC&page=1&user_key=e314b958fbba5e68116283cf9f8cd96e").
	    to_return(:status => 200, :body => organizations_three_product_pages_response)
	end

	def stub_each_product_for_the_first_page
	  products_data = JSON.parse(organizations_three_product_pages_response)
	  products_data['data']['items'].each do |product|
	    stub_request(:get, "http://api.crunchbase.com/v/2/#{product['path']}?user_key=e314b958fbba5e68116283cf9f8cd96e").
	      to_return(:status => 200, :body => product_basecamp_response)
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

	def organizations_only_one_product_page_response
	  <<-JSON
	    {
	     "data": {
	          "items": [
	               {
	                "name": "Basecamp",
	                "path": "product/basecamp"
	               }
	              ],
	          "paging": {
	              "total_items": 1
	            }
	          }
	      }
	  JSON
	end

	def organizations_only_one_company_page_with_company_without_board_response
	  <<-JSON
	    {
			 "data": {
					  "items": [
							   {
							    "name": "home-inventory-s-pecialists-llc",
							    "path": "organization/home-inventory-s-pecialists-llc"
							   }
							  ],
					  "paging": {
					   		"total_items": 1
					  	}
					  }
			 	}
	  JSON
	end

	def company_without_board
		<<-JSON
		{
		    "metadata": {
		        "version": 2,
		        "www_path_prefix": "http://www.crunchbase.com/",
		        "api_path_prefix": "http://api.crunchbase.com/v/2/",
		        "image_path_prefix": "http://images.crunchbase.com/"
		    },
		    "data": {
		        "uuid": "4667033762fa3c0d9dd88c6687dd8c8a",
		        "type": "Organization",
		        "properties": {
		            "role_company": true,
		            "description": "To help our clients keep a peace of mind when or if a disaster happens to them. Providing a proof of ownership will enable their insurance claims when amde to be settled within a timely manor.",
		            "short_description": "To help our clients keep a peace of mind when or if a disaster happens to them.",
		            "founded_on_day": 7,
		            "founded_on_month": 12,
		            "founded_on_year": 2008,
		            "founded_on": "2008-12-07",
		            "founded_on_trust_code": 7,
		            "permalink": "home-inventory-s-pecialists-llc",
		            "primary_role": "company",
		            "is_closed": false,
		            "closed_on_trust_code": 0,
		            "name": "Home Inventory S[pecialists",
		            "closed_on_day": null,
		            "closed_on_month": null,
		            "closed_on_year": null,
		            "closed_on": null,
		            "created_at": 1405633587,
		            "updated_at": 1405669157,
		            "total_funding_usd": 0,
		            "number_of_investments": 0,
		            "number_of_employees": 4
		        },
		        "relationships": {
		            "current_team": {
		                "paging": {
		                    "total_items": 1,
		                    "first_page_url": "http://api.crunchbase.com/v/2/organization/home-inventory-s-pecialists-llc/current_team",
		                    "sort_order": "custom"
		                },
		                "items": [
		                    {
		                        "first_name": "Carl",
		                        "last_name": "Carick",
		                        "title": "General, Business Development",
		                        "started_on": null,
		                        "path": "person/carl-carick",
		                        "created_at": 1405849619,
		                        "updated_at": 1405849619
		                    }
		                ]
		            },
		            "offices": {
		                "paging": {
		                    "total_items": 1,
		                    "first_page_url": "http://api.crunchbase.com/v/2/organization/home-inventory-s-pecialists-llc/offices",
		                    "sort_order": "created_at DESC"
		                },
		                "items": [
		                    {
		                        "name": "Headquarters",
		                        "street_1": null,
		                        "street_2": null,
		                        "city": "Boonville",
		                        "region": null,
		                        "country_code": null,
		                        "type": "Address",
		                        "created_at": 1405633670,
		                        "updated_at": 1405633670
		                    }
		                ]
		            },
		            "headquarters": {
		                "paging": {
		                    "total_items": 1,
		                    "first_page_url": "http://api.crunchbase.com/v/2/organization/home-inventory-s-pecialists-llc/headquarters",
		                    "sort_order": "created_at DESC"
		                },
		                "items": [
		                    {
		                        "name": "Headquarters",
		                        "street_1": null,
		                        "street_2": null,
		                        "city": "Boonville",
		                        "region": null,
		                        "country_code": null,
		                        "type": "Address",
		                        "created_at": 1405633670,
		                        "updated_at": 1405633670
		                    }
		                ]
		            },
		            "funding_rounds": {
		                "paging": {
		                    "total_items": 1,
		                    "first_page_url": "http://api.crunchbase.com/v/2/organization/home-inventory-s-pecialists-llc/funding_rounds",
		                    "sort_order": "created_at DESC"
		                },
		                "items": [
		                    {
		                        "type": "FundingRound",
		                        "name": "Home Inventory S[pecialists Funding Round",
		                        "path": "funding-round/476ac0e1c4c17761cba54d8161b90847",
		                        "created_at": 1405669157,
		                        "updated_at": 1405669157
		                    }
		                ]
		            }
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

	def product_basecamp_response
	  <<-JSON
	  {
	   "metadata": {
	    "version": 2,
	    "www_path_prefix": "http://www.crunchbase.com/",
	    "api_path_prefix": "http://api.crunchbase.com/v/2/",
	    "image_path_prefix": "http://images.crunchbase.com/"
	   },
	   "data": {
	    "uuid": "9433b16a214b5ae20ed484f1aa0443ec",
	    "type": "Product",
	    "properties": {
	     "lifecycle_stage": "live",
	     "owner_id": "11b56c0216feeeee5cefcc19b2b7f44b",
	     "short_description": "Basecamp is a project management and group collaboration tool. It was launched in 2004 as 37signals first product. The tool includes",
	     "permalink": "basecamp",
	     "name": "Basecamp",
	     "description": "Basecamp is a project management and group collaboration tool. It was launched in 2004 as 37signals first product. The tool includes features for schedules, tasks, files, and messages. Basecamp is where the Ruby on Rails framework was derived from. Pricing starts at free for one active project and works itself up in tiers depending on how many active projects you want. Basecamp was redesigned in 2012; the remainder of this article needs to be updated as appropriate.",
	     "homepage_url": "http://www.basecamphq.com",
	     "created_at": 1185258112,
	     "updated_at": 1397995407
	    },
	    "relationships": {
	     "primary_image": {
	      "paging": {
	       "total_items": 1,
	       "first_page_url": "http://api.crunchbase.com/v/2/product/basecamp/primary_image",
	       "sort_order": "created_at DESC"
	      },
	      "items": [
	       {
	        "type": "ImageAsset",
	        "title": null,
	        "path": "image/upload/v1397239442/0d227cdaeed0babdcf0af83eaa06847c.png",
	        "created_at": 1398019274,
	        "updated_at": 1398019274
	       }
	      ]
	     },
	     "images": {
	      "paging": {
	       "total_items": 1,
	       "first_page_url": "http://api.crunchbase.com/v/2/product/basecamp/images",
	       "sort_order": "created_at DESC"
	      },
	      "items": [
	       {
	        "type": "ImageAsset",
	        "title": null,
	        "path": "image/upload/v1397239443/71bee12ceffb100f4449ec6669c8a1eb.png",
	        "created_at": 1398019274,
	        "updated_at": 1398019274
	       }
	      ]
	     },
	     "websites": {
	      "paging": {
	       "total_items": 4,
	       "first_page_url": "http://api.crunchbase.com/v/2/product/basecamp/websites",
	       "sort_order": "created_at DESC"
	      },
	      "items": [
	       {
	        "url": "http://www.twitter.com/37signals",
	        "type": "WebPresence",
	        "title": "twitter",
	        "created_at": 1397877760,
	        "updated_at": 2014
	       },
	       {
	        "url": "http://www.twitter.com/37signals",
	        "type": "WebPresence",
	        "title": "twitter",
	        "created_at": 1185258112,
	        "updated_at": 1397995407
	       },
	       {
	        "url": "http://productblog.37signals.com/",
	        "type": "WebPresence",
	        "title": "blog",
	        "created_at": 1185258112,
	        "updated_at": 1397995407
	       },
	       {
	        "url": "http://www.basecamphq.com",
	        "type": "WebPresence",
	        "title": "homepage",
	        "created_at": 1185258112,
	        "updated_at": 1397995407
	       }
	      ]
	     },
	     "news": {
	      "paging": {
	       "total_items": 9,
	       "first_page_url": "http://api.crunchbase.com/v/2/product/basecamp/news",
	       "sort_order": "created_at DESC"
	      },
	      "items": [
	       {
	        "url": "http://techcrunch.com/2013/07/09/toms-planner-acquires-gantt-chart-service-competitor-gantto/",
	        "author": "Stephanie Yang",
	        "posted_on": "2013-07-09",
	        "type": "PressReference",
	        "title": "Tom's Planner Acquires Gantt Chart Service Competitor Gantto",
	        "created_at": 1373415618,
	        "updated_at": 2013
	       },
	       {
	        "url": "http://techcrunch.com/2013/02/08/after-8-years-on-the-web-project-management-platform-basecamp-finally-launches-an-official-ios-app/",
	        "author": "Rip Empson",
	        "posted_on": "2013-02-08",
	        "type": "PressReference",
	        "title": "After 8 Years On The Web, Project Management Platform Basecamp Finally Launches An “Official” iOS App",
	        "created_at": 1360386012,
	        "updated_at": 2013
	       },
	       {
	        "url": "http://techcrunch.com/2012/04/21/asana-stats/",
	        "author": "Josh Constine",
	        "posted_on": "2012-04-21",
	        "type": "PressReference",
	        "title": "Twitter and LinkedIn Manage Tasks With Asana, New API Means Robots Can Too",
	        "created_at": 1335032951,
	        "updated_at": 2012
	       },
	       {
	        "url": "http://www.techcrunch.com/2009/06/22/liquidplanner-finds-1-million-for-project-management-software/",
	        "author": "Leena Rao",
	        "posted_on": "2009-06-22",
	        "type": "PressReference",
	        "title": "LiquidPlanner Finds $1 Million For Project Management Software",
	        "created_at": 1245695994,
	        "updated_at": 2009
	       },
	       {
	        "url": "http://www.techcrunch.com/2009/02/16/clarizen-project-management-for-non-project-managers-free-1-yr-subscriptions/",
	        "author": "Roi Carthy",
	        "posted_on": "2009-02-16",
	        "type": "PressReference",
	        "title": "Clarizen: Project Management for Non-Project Managers (Free 1 yr. Subscriptions!)",
	        "created_at": 1234804805,
	        "updated_at": 2009
	       },
	       {
	        "url": "http://www.techcrunch.com/2009/02/02/wiggio-comes-out-of-beta-with-a-yammer-for-college-students/",
	        "author": "Erick Schonfeld",
	        "posted_on": "2009-02-02",
	        "type": "PressReference",
	        "title": "Wiggio Comes Out Of Beta With A Yammer For College Students",
	        "created_at": 1233601487,
	        "updated_at": 2009
	       },
	       {
	        "url": "http://www.techcrunch.com/2008/12/30/organize-your-company-with-wizehive-beta-invites/",
	        "author": "Erick Schonfeld",
	        "posted_on": "2008-12-30",
	        "type": "PressReference",
	        "title": "Organize Your Company With WizeHive (Beta Invites)",
	        "created_at": 1230661630,
	        "updated_at": 2009
	       },
	       {
	        "url": "http://www.techcrunch.com/2005/12/13/new-stuff-at-basecamp/",
	        "author": "Michael Arrington",
	        "posted_on": "2005-12-13",
	        "type": "PressReference",
	        "title": "New Stuff at Basecamp",
	        "created_at": 1220666504,
	        "updated_at": 2008
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

	def organizations_three_product_pages_response
	  <<-JSON
	    {
	      "data": {
	          "items": [
	              {
	                  "updated_at": 1397995342,
	                  "name": "3C Plus - IP PBX",
	                  "path": "product/3c-plus-ip-pbx",
	                  "created_at": 1380013219,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Cloud Call Center",
	                  "path": "product/cloud-call-center",
	                  "created_at": 1380013219,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "LightCMS",
	                  "path": "product/lightcms",
	                  "created_at": 1288045642,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Radium3",
	                  "path": "product/radium3",
	                  "created_at": 1288048004,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Valentines Cards",
	                  "path": "product/valentines-cards",
	                  "created_at": 1359488039,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Five Dollar Shake Cards",
	                  "path": "product/five-dollar-shake-cards",
	                  "created_at": 1359488039,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Birthday Cards Women",
	                  "path": "product/birthday-cards-women",
	                  "created_at": 1359488039,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "ItalianPod101.com",
	                  "path": "product/italianpod101-com",
	                  "created_at": 1328608750,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "GreekPod101.com",
	                  "path": "product/greekpod101-com",
	                  "created_at": 1328608750,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "PortuguesePod101.com",
	                  "path": "product/portuguesepod101-com",
	                  "created_at": 1328608750,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "DocMail API",
	                  "path": "product/docmail-api",
	                  "created_at": 1244081347,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Gratitude Products",
	                  "path": "product/gratitude-products",
	                  "created_at": 1244070413,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Token of Appreciation",
	                  "path": "product/token-of-appreciation",
	                  "created_at": 1244070413,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Techinline Remote Desktop",
	                  "path": "product/techinline-remote-desktop",
	                  "created_at": 1244063596,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Kynetx AppBuilder",
	                  "path": "product/intersekt",
	                  "created_at": 1227054391,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "BETA PRO 50",
	                  "path": "product/beta-pro-50",
	                  "created_at": 1227032778,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Nectar Personal Websites",
	                  "path": "product/nectar-personal-websites",
	                  "created_at": 1227050454,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Encentivizer Platform",
	                  "path": "product/encentivizer-platform",
	                  "created_at": 1397701985,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995342,
	                  "name": "Wikison Wetpaint",
	                  "path": "product/wetpaint-wiki",
	                  "created_at": 1180145922,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "3C Plus - IVR",
	                  "path": "product/3cplus-ivr",
	                  "created_at": 1380013220,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "Inbound and Outbound VOIP",
	                  "path": "product/inbound-and-outbound-voip",
	                  "created_at": 1380013220,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "Voice Messages",
	                  "path": "product/voice-messages",
	                  "created_at": 1380013220,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "Rankmeme",
	                  "path": "product/rankmeme",
	                  "created_at": 1288061626,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "MO-Call",
	                  "path": "product/mo-call",
	                  "created_at": 1288097601,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "custom shoot CG photography",
	                  "path": "product/custom-shoot-cg-photography",
	                  "created_at": 1288136209,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "TVUPack",
	                  "path": "product/tvupack",
	                  "created_at": 1288130087,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "GPU.NET",
	                  "path": "product/gpu-net",
	                  "created_at": 1288146869,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "Birthday Cards Men",
	                  "path": "product/birthday-cards-men",
	                  "created_at": 1359488039,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "Wedding Cards",
	                  "path": "product/wedding-cards",
	                  "created_at": 1359488039,
	                  "type": "Product"
	              },
	              {
	                  "updated_at": 1397995343,
	                  "name": "Mother's Day Cards",
	                  "path": "product/mothers-day-cards",
	                  "created_at": 1359488040,
	                  "type": "Product"
	              }
	          ],
	          "paging": {
	              "next_page_url": "http://api.crunchbase.com/v/2/products?page=2",
	              "total_items": 30,
	              "number_of_pages": 1,
	              "sort_order": "updated_at ASC",
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