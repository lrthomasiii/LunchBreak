$(document).on('page:load', function(){
	$(".hide-btn-u").click(function(){
		if($(".events").hasClass("hide")){
			$(".events").removeClass("hide");
			$(".hide-btn-u").text("Hide events");
		} else {
			$(".events").addClass("hide");
			$(".hide-btn-u").text("Show events");
		}
	});
});