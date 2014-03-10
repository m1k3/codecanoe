class Build < ActiveRecord::Base
  STATUS_TEXTS = {
    0 => 'is running',
    1 => 'succeeded',
    2 => 'failed',
  }


  belongs_to :app
  belongs_to :build_configuration

  delegate :name, :commands, to: :build_configuration

  def status_text
    STATUS_TEXTS[status]
  end

  def succeeded!
    update_attribute(:status, 1)
  end
  def failed!
    update_attribute(:status, 2)
  end
end
