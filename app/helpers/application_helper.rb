module ApplicationHelper
	def bg_header
		if current_page?(init_path)||current_page?(root_path)
			return nil
		elsif (session[:user_name].nil?)||current_page?(login_path)
			return	content_tag(:div, \
						image_tag('title-1.jpg'), \
					class: 'header', data: {role: 'header'})
		elsif current_page?(main_path)
			content_tag :div, class: 'header', \
				data: {role: 'header'} do
				image_tag('title-1.jpg')+
				link_to("登出", \
					session_path, \
					method: :delete, \
					data: {role: 'button', \
						theme: 'b'}, \
					class: 'ui-btn-right')
			end
		else
			content_tag :div, class: 'header', \
				data: {role: 'header'} do
				link_to('返回', '#', \
					'data-icon': 'arrow-l', \
					'data-theme': 'b', \
					'data-rel': "back")+
				image_tag('title-1.jpg')+
				link_to("登出", \
					session_path, \
					method: :delete, \
					data: {role: 'button', \
						theme: 'b'}, \
					class: 'ui-btn-right')
			end
		end
	end
end
