class Member < ApplicationRecord

    belongs_to :category

    validates :last_name, presence: true, length: { maximum: 20 }
    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name_kana, presence: true, length: { maximum: 20 }
    validates :first_name_kana, presence: true, length: { maximum: 20 }
    validates :position, presence: true, length: { maximum: 30 }
    validates :height, numericality: { only_integer: true}, length: {is: 3}
    validates :weight, numericality: { only_integer: true}, length: {in: 2..3}
    validates :original_team, presence: true, length: { maximum: 50 }
    validates :hobby, presence: true, length: { maximum: 50 }
    validates :goal, presence: true, length: { maximum: 50 }


    attachment :image

    enum grade: { grade_1st: 0, grade_2nd: 1, grade_3rd: 2, staff: 3}
    
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            member = find_by(id: row["id"]) || new
            member.attributes = row.to_hash.slice(*updatable_attributes)
            member.save
        end
    end
    
    def self.updatable_attributes
        ["category_id",
        "image",
        "last_name",
        "first_name",
        "last_name_kana",
        "first_name_kana",
        "grade","position",
        "height","weight",
        "original_team",
        "hobby","goal"
        ]
    end

end
