require 'webmock/rspec'
WebMock.disable_net_connect!(:allow_localhost => true)
WebMock::BodyPattern::BODY_FORMATS['application/soap+xml'] = :xml