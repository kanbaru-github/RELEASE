class Relationship < ApplicationRecord

  belongs_to :muter, class_name: "Customer"
  # muter:ミュートする
  belongs_to :muted, class_name: "Customer"
  # muted：ミュートされる

end
