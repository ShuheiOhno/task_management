class Complete < ActiveHash::Base
  self.data = [
    {id: 1, name: "完了"},
    {id: 2, name: "中止"}
  ]

  include ActiveHash::Associations
  has_many :projects
end