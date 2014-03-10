require 'net/http'
require 'uri'
require 'ostruct'

class BuildRunner
  ENDPOINT_URL = "http://example.com/builds"

  def self.execute(builds)
    builds.map do |build|
      start_build(build.id, build.commands).code == "200"
    end
  end

  def self.start_build(id, commands)
    if ENV['HIT_BUILDERS'] == 'true'
      uri = URI.parse("#{ENDPOINT_URL}")
      Net::HTTP.post_form(uri, {id: id, commands: commands})
    else
      OpenStruct.new(code: '200')
    end
  end
end
