class BuildInitializer
  def self.execute(app)
    BuildRunner.execute(app.create_build)
  end
end
