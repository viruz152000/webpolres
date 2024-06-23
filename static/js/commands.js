$('#file').change(function() {
	var fileExt = $(this).val().split('.').pop();

	$.ajax({
		type: 'POST',
		url: '{% url "validate-file" %}',
		data: {
			csrfmiddlewaretoken: '{{ csrf_token }}',
			fileExt: fileExt
		},
		success: function(data) {
			console.log(data);
		}
	});
	// $.ajax({
	// 	type: 'POST',
	// 	url: '{% url "file-validate" %}',
	// 	data: {
	// 		csrfmiddlewaretoken: '{{ csrf_token }}',
	// 		file: file
	// 	},
	// 	success: function (data) {
	// 		console.log(data);
	// 	},
	// 	error: function (xhr, status, error) {
	// 		console.error(error);
	// 	}
	// });

});