$(document).on('turbolinks:load', function() {
	//auto hide alert message
	setTimeout(function(){
		$('#movie-alert').remove();
	}, 2000);

//user rating add function
	$(".user-rating").click(function(){
		$.ajax({
			type: 'POST',
			url: "ratings",
			data: {movie_id: $(this).closest(".card-body").find("input[name=quantity]").val(), rating_value: parseInt(this.id)},
			dataType : 'script'
		});
	});

	//movie image crop function
	var PictureCropper,
	bind = function(fn, me){ "use strict"; return function(){ return fn.apply(me, arguments); }; };

	$(function() {
		"use strict";
		return new PictureCropper();
	});

	PictureCropper = (function() {
		"use strict";
		function PictureCropper() {
			this.updatePreview = bind(this.updatePreview, this);
			this.update = bind(this.update, this);
			$('#cropImage').Jcrop({
				aspectRatio: 270/370,
				setSelect: [0, 0, 270, 370],
				onSelect: this.update,
				onChange: this.update,
				boxWidth: 600
			});
		}

		PictureCropper.prototype.update = function(coords) {
			$('#movie_crop_x').val(coords.x);
			$('#movie_crop_y').val(coords.y);
			$('#movie_crop_w').val(coords.w);
			$('#movie_crop_h').val(coords.h);
			return this.updatePreview(coords);
		};

		PictureCropper.prototype.updatePreview = function(coords) {
			var rx, ry,rscale;
			rscale =  coords.w/$('.jcrop-current').width()
			rx = 135 / coords.w;
			ry = 185 / coords.h;

			return $('#movie_prev').css({
				width: Math.round(rx * $('#cropImage').width() * rscale) + 'px',
				height: Math.round(ry * $('#cropImage').height() * rscale) + 'px',
				marginLeft: '-' + Math.round(rx * coords.x) + 'px',
				marginTop: '-' + Math.round(ry * coords.y) + 'px'
			});
		};
		return PictureCropper;
	})();

	$(function () {
		"use strict";
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#cropImage').attr('src', e.target.result);
					$('#movie_prev').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#movieInp").on("change",function () {
			$("#upload-modal").modal("show");
			readURL(this);
		});
	});

});
