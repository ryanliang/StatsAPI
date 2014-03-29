class Execution < Sequel::Model
  plugin :timestamps

  def before_create
    self.created_at ||= Time.now
    self.updated_at ||= self.created_at

    stats = parse_stats(self.raw_stats)

    self.duration = stats[0]
    self.total    = stats[1]
    self.failed   = stats[2]

    super
  end

  private

  def parse_stats(data)
    stats    = data.split(',')
    duration = stats[0].delete('seconds').strip.to_f
    total    = stats[1].delete('examples').strip.to_i
    failed   = stats[2].delete('failures').strip.to_i
    [duration, total, failed]
  end
end
