class User<ApplicationRecord
    belongs_to :role
    before_save {self.email = email.downcase}
    validates :user_name, presence: true, length: {minimum:2},
              format: {with: /^[a-zA-Z ]*$/, multiline: true}

    validates :email, presence: true, length: {maximum: 105},
              uniqueness: {case_sensitive: false},
              format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

    validates :role_id, presence: true
end