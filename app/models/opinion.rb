class Opinion < ApplicationRecord
    
    belongs_to:user,optional: true
    has_many:comments, dependent: :destroy
    has_many:judges, dependent: :destroy
    
end
