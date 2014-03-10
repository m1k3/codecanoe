require 'spec_helper'

describe BuildRunner do
  let(:build) {double(id: 42, commands: 'bundle exec rake')}

  it 'should should run the builds' do
    ENV['HIT_BUILDERS'] = 'true'
    builds = [build]

    request_stub = stub_request(:post, "http://example.com/builds").
                     with(body: {"commands"=>"bundle exec rake", "id"=>"42"}).
                     to_return(:status => 200)

    BuildRunner.execute(builds).should == [true]
    request_stub.should have_been_requested
  end

  it 'should skip builders when disabled' do
    ENV['HIT_BUILDERS'] = 'false'
    BuildRunner.execute([build]).should == [true]
  end
end
