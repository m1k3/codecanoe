class Build < ActiveRecord::Base
  STATUS_TEXTS = {
    0 => 'is currently running',
    1 => 'succeeded',
    2 => 'failed',
  }


  belongs_to :app
  belongs_to :build_configuration

  delegate :name, :commands, to: :build_configuration

  def status_text
    STATUS_TEXTS[status]
  end
end
