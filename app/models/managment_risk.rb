class ManagmentRisk < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true, format:{ with: /\A[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ0-9_ ]+\z/, message: "deve conter apenas letras e números" }, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :probability, presence: true
  validates :contingency, presence: true
end
