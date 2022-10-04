class Meeting < ApplicationRecord
  belongs_to :external_service

  def uids
    user_ids.to_s.scan(/\d+/).map(&:to_i)
  end

  def users
    if uids.empty?
      []
    else
      User.find(uids)
    end
  end
end
