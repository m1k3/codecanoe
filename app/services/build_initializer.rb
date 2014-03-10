class BuildInitializer
  def self.execute(app)
    BuildRunner.execute(app.create_builds)
  end
end
