class App < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :build_configurations
  has_many :builds


  def run_builds
    BuildInitializer.execute(self)
  end

  def create_builds
    transaction do
      build_configurations.map{|bc| builds.create!(build_configuration: bc) }
    end
  end
end
