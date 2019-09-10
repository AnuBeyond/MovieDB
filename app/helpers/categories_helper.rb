module CategoriesHelper
  $count = 0

  def nested_dropdown(items)
    result = []
    items.each do |item|
      if item.parent.blank?
        result << [item.name, item.id]
      else
      result << ['|'+('- ' * get_parent_count(item)) + item.name, item.id]
      $count = 0
    end
      result += nested_dropdown(item.children) unless item.children.blank?
    end
    result
  end

  def get_parent_count(item)
    if item.parent
      $count += 1
      get_parent_count(item.parent)
    end
    return $count
  end
end
