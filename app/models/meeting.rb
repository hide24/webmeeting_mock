class Meeting < ApplicationRecord
  belongs_to :external_service

  def uids
    user_ids.to_s.split(',').map(&:strip)
  end

  def users
    if uids.empty?
      []
    else
      User.find(uids).all
    end
  end
end
