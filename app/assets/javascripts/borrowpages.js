// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('pageshow', '.borrowlist', function(e, data){

	$('.check-button').click(function() {
		checkbox = $(this).siblings('.ui-btn').children('.ui-checkbox').children('input');
		if (!checkbox.prop('checked')) {
			$(this).buttonMarkup({theme: 'b'});
			$(this).find('span.ui-btn').buttonMarkup({
				theme: 'b'
			});
			checkbox.prop('checked',true);
		} else {
			$(this).buttonMarkup({theme: 'a'});
			$(this).find('span.ui-btn').buttonMarkup({
				theme: 'a'
			});
			checkbox.prop('checked',false);
		}
	});

	// Property detail button
	$('.property_detail').on('click', function(){
		// click_id 	= $(this).parent().attr('val');
		name 		= $(this).children('h2').text();
		image_url 	= $(this).children('span').text();
		console.log(image_url);

		$("#borrowpage-dialog-name").text(name);
		$("#borrowpage-dialog-image").attr("src", image_url);
	});
});