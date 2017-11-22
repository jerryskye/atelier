class Category < ActiveYaml::Base
  include ActiveHash::Associations
  set_root_path "db/data"
  has_many :books

  def similar_books
    Book.where(category_id: similar_ids)
  end

  private

  def similar_ids
    similar_categories.map { |name| Category.find_by(name: name).id }
  end
end
