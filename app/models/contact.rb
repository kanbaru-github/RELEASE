class Contact < ApplicationRecord

  enum subject: {問い合わせ: 0, 質問: 1}

end
