class Idea < ActiveRecord::Base
  has_many :idea_comments, class_name: Comment, foreign_key: :id_idea 
end
