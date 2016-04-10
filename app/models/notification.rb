class Notification < ActiveRecord::Base
	enum no_type: [:notice, :remine]
end
