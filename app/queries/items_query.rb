class ItemsQuery
  class << self
    delegate :all, :find, to: :new
  end

  def all
    Item.active
  end

  def find(id:)
    all.find_by(id: id)
  end
end
