# frozen_string_literal: true

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

  # def select_options_using_filter(filter)
  #   if filter.nil? || filter == 'Candidate'
  #     options_for_select(%w[Candidate Voters], 'Candidate')
  #   else
  #     options_for_select(%w[Candidate Voters], 'Voter')
  #   end
  # end

  def extract_party_name(user_id)
    Candidate.find_by(user_id: user_id).party_name
  end

  def total_votes(user_id)
    candidate_votes = Candidate.find_by(user_id: user_id)&.votes
    candidate_votes.length
  end

  def election_opened?
    Election.last.end_time >= Time.zone.now.localtime.strftime('%a, %d %b %Y %H:%M:%S')
  end
end
