require 'spec_helper'

describe BuildInitializer do
  it 'should create a build' do
    app = double
    app.should_receive(:create_build).and_return(42) # 42 is the ID of the newly created build

    described_class.execute(app)
  end
  it 'should initialize the build' do
    app = double(create_build: 42)

    BuildRunner.should_receive(:execute).with(42)
    described_class.execute(app)
  end
end
