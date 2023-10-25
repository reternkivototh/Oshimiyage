module Public::PostImagesHelper
  def number_to_currency(price)
    "#{@post_image.price.to_s(:delimited, delimiter: ',')}"
  end
end
