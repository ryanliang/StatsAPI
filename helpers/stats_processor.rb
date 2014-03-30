class StatsProcessor

  def self.create(stats)
    suite, name, size = stats['test_suite'], stats['area'], stats['size']
    area = Area.first(test_suite: suite, name: name, size: size)

    if area.nil?
      area = Area.new do |a|
        a.test_suite = suite
        a.name = name
        a.size = size
        a.save
      end
    end

    Execution.new do |e|
      e.area_id = area.area_id
      e.year = stats['year']
      e.release = stats['release']
      e.raw_stats = stats['raw_stats']
      e.tc_agent = stats['tc_agent']
      e.env = stats['env']
      e.install = stats['install']
      e.os = stats['os']
      e.browser = stats['browser']
      e.major_version = stats['major_version']
      e.minor_version = stats['minor_version']
      e.save
    end
    '{"msg":"successful"}'
  end

end
