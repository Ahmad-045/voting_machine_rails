module ApplicationHelper

  def extract_halka_name(halka_id)
    Halka.find(halka_id).name
  end

  def status_format(check)
    check = Candidate.find_by(user_id: check).approved
    check == true ? 'Approved' : 'Not Approved'
  end

end
