module ApplicationHelper
  def extract_halka_name(halka_id)
    Halka.find(halka_id).name
  end
end
