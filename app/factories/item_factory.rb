class ItemFactory < Base
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def create
    Item.new(
      name: params[:name].titleize,
      description: params[:description].capitalize,
      category: params[:category].downcase,
      color: params[:color]
    )
  rescue StandardError => e
    Rails.logger.error("ERROR: #{self.class} #{e} during #{__method__} method.")
    false
  end
end
