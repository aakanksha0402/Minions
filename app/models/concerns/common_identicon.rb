module CommonIdenticon
  extend ActiveSupport::Concern

  SIZE = {small: 128, medium: 256, large: 420}

  def dynamic_identicon(size)
    Identicon.data_url_for try(:title).try(:name), SIZE[:"#{size}"]
  end

end
