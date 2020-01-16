class Opinion < ApplicationRecord
    
    belongs_to:user,optional: true
    has_many:comments, dependent: :destroy
    has_many:judges, dependent: :destroy

    validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
    
    def self.search(search) #self.でクラスメソッドとしている
        if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
          Opinion.where(['content LIKE ?', "%#{search}%"])
        else
          Opinion.all #全て表示。
        end
    end

    has_many:likes
    has_many:liked_users, through: :likes, source: :user

end
