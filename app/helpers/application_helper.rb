module ApplicationHelper
	# Flash messages
	def flash_class(level)
		case level
		when 'notice' then "alert alert-info alert-dismissible fade show "
		when 'success' then "alert alert-success alert-dismissible fade show"
		when 'error' then "alert alert-danger alert-dismissible fade show"
		when 'alert' then "alert alert-warning alert-dismissible fade show"
		end
	end

	# Default user avatar
	def user_avatar(user_id, avatar_class)
		user = User.find(user_id)
		if user.avatar.attached?
			image_tag user.avatar, class: avatar_class
		else
			image_tag 'default_profile_pic.png', class: avatar_class
		end
	end

end
