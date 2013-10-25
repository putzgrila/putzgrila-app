$(document).ready(function(){
	$("#complain-type").click(function(){
		$("#compain-type-listing").addClass("covered-page");
	})

	$(".entry-complain-type .input-buttons").click(function(){
		$("#compain-type-listing").addClass("covered-page");
	})

	$("#compain-type-listing .goback").click(function(){
		$("#compain-type-listing").removeClass("covered-page");
	})

	$("#complain-list li").click(function(){
		var witchComplain = $(this).text();
		$("#complain-type").text(witchComplain);
		$("#complain-type").removeClass("empty-textarea");
		$("#compain-type-listing").removeClass("covered-page");
	})

	$(".entry-vehicle .input-buttons").click(function(){
		$("#vehicle-number-help").addClass("covered-page");
	})

	$("#vehicle-number-help .goback").click(function(){
		$("#vehicle-number-help").removeClass("covered-page");
	})

	var isMenuOpen=false;
	$(".show-menu").click(function(){
		if (isMenuOpen==false){
			isMenuOpen=true;
			$(".wrapper-app").addClass("menu-is-open");
		} else {
			isMenuOpen=false;
			$(".wrapper-app").removeClass("menu-is-open");
		}
	})
});