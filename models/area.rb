class Area < Sequel::Model
  plugin :timestamps

  def before_create
    self.display_name = self.name
    super
  end
end 