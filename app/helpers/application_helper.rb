module ApplicationHelper
	def bg_header
		if current_page?(init_path)||current_page?(root_path)
			return nil
		elsif (session[:user_name].nil?)||current_page?(login_path)
			content_tag :div, class: 'header', data: {role: 'header'} do
				image_tag('title-1.jpg')
			end
		elsif current_page?(main_path)
			content_tag :div, class: 'header', data: {role: 'header'} do
				image_tag('title-1.jpg')+
				link_to("登出", session_path, class: 'ui-btn-right', method: :delete, data: {role: 'button', theme: 'b'})
			end
		else
			content_tag :div, class: 'header', data: {role: 'header'} do
				link_to('返回', '#', 'data-icon': 'arrow-l', 'data-theme': 'b', 'data-rel': "back")+
				image_tag('title-1.jpg')+
				link_to("登出", session_path, class: 'ui-btn-right', method: :delete, data: {role: 'button', theme: 'b'})
			end
		end
	end

	def popup_item(id, title, &block)
		content_tag :div, class: 'popupItem', id: id, 'data-role': 'popup', 'data-transition': 'pop',  'data-history': false do
			content_tag(:div, "data-role": "header", "data-theme": 'b') do
				content_tag(:h3, title)
			end +
			content_tag(:div, :style => 'padding:10px 20px;') do
				capture(&block) +
				link_to('返回', '#', class: 'ui-btn ui-corner-all ui-shadow', 'data-role': 'button', 'data-rel': 'back')
			end
		end		
	end
end
