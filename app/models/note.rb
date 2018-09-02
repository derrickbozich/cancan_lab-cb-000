class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  # accepts_nested_attributes_for :readers

  def visible_to
    self.readers.map {|reader| reader.name }.join(", ")
  end

  def visible_to=(name_list)
    binding.pry
    user = User.find_by_id(self.user_id)
    if user
      self.readers << user
    end

    name_list.split(", ").each do |name|
      reader = User.find_by(:name => name)
      if reader
        self.readers << reader
      end
    end
    self.readers
  end
end
