class Relationship < ApplicationRecord

  belongs_to :muter, class_name: "Customer"
  # mute:ミュートする
  belongs_to :muted, class_name: "Customer"
  # mute：ミュートされる

end
