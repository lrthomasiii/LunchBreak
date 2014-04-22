$(document).on('page:load', function(){
	$(".hide-btn-e").click(function(e){
		var eventClicked = $(e.target).closest(".event");
		if ( eventClicked.hasClass("hide") ){
			eventClicked.removeClass("hide");
			$(".hide-btn-e").text("Hide event");
		} else {
			eventClicked.addClass("hide");
			$(".hide-btn-e").text("Show event");
		}
	});

});