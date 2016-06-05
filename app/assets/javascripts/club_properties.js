$(document).on('pageshow', '#page-property',function(e, data) {
	preview = $('.upload-preview img');
	click_id = null;

	// upload image preview
	$('#input-image').change(function(event){
		input = $(event.currentTarget);
		file = input[0].files[0];
		reader = new FileReader();
		reader.onload = function(e){
	    	image_base64 = e.target.result;
	    	preview.attr("src", image_base64);
		};
		reader.readAsDataURL(file);
	});

	// Property detail button
	$('.property_detail').on('click', function(){
		// click_id 	= $(this).parent().attr('val');
		name 		= $(this).children('h2').text();
		image_url 	= $(this).children('span').text();

		$("#property-dialog-name").text(name);
		$("#property-dialog-image").attr("src", image_url);
	});

	// Delete property icon button
	$('.ui-icon-delete').on('click', function(){
		click_id = $(this).parent().attr('val');
	})

	// Delete property button in detail dialog
	$('#delete_roperty').click(function(){
		$('#delete-'+click_id).children('a').click();
	});

	$('#addproperty_form').on('ajax:success', function(e, data, status, xhr){
		console.log(status);
	});


});