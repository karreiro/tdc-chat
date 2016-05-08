module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_current_user
    end

    protected

    def find_current_user
      User.find_by(id: current_user_id) || reject_unauthorized_connection
    end

    def current_user_id
      cookies.signed[:current_user_id]
    end
  end
end
