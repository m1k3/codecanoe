require 'spec_helper'

describe BuildInitializer do
  before :each do
    BuildRunner.stub(:execute)
  end

  it 'should initialize a build' do
    app = double
    app.should_receive(:create_builds).and_return([double])

    described_class.execute(app)
  end
  it 'should run the builds' do
    builds = [double]
    app = double(create_builds: builds)

    BuildRunner.should_receive(:execute).with(builds)
    described_class.execute(app)
  end
end
