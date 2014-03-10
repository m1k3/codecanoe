class App < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :build_configurations


  def run_builds
    BuildInitializer.execute(self)
  end

  def create_build
    raise NotImplementedError, 'first add database stuff'
  end
end
