module ApplicationHelper

  def extract_halka_name(halka_id)
    Halka.find(halka_id).name
  end

  def status_format(check)
    if Candidate.find_by(user_id: check)
      check = Candidate.find_by(user_id: check).approved
      check == true ? 'Approved' : 'Not Approved'
    else
      '----'
    end
  end

  def extract_party_name(user_id)
    Candidate.find_by(user_id: user_id).party_name
  end

  def total_votes(user_id)
    Candidate.find_by(user_id: user_id)&.votes.length
  end

  def election_opened?
    Election.last.end_time >= Time.zone.now.localtime.strftime("%a, %d %b %Y %H:%M:%S")
  end
end
