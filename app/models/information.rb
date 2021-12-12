class Information < ApplicationRecord

  attachment :image

  enum category: { general: 0, announcement: 1, other: 2}

end
