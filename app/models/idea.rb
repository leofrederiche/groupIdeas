class Idea < ActiveRecord::Base
  has_many :idea_comments, class_name: Comment, foreign_key: :id_idea
  has_many :votations, class_name: Votation, foreign_key: :id_idea
  has_many :employees, class_name: Employees, foreign_key: :id_idea
end
