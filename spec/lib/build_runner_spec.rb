require 'spec_helper'

describe BuildRunner do

  it 'should should run the builds' do
    builds = [double(id: 42, commands: 'bundle exec rake')]

    request_stub = stub_request(:post, "http://example.com/builds").
                     with(body: {"commands"=>"bundle exec rake", "id"=>"42"}).
                     to_return(:status => 200)

    BuildRunner.execute(builds).should == [true]
    request_stub.should have_been_requested
  end
end
