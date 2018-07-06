
$(document).scroll(function(){
	$('.tlt').textillate({
		loop: true
	});


	var con = $("#scroll");
	// var elem = $("#nav");
	var position = $(window).scrollTop();
	
	if(window.innerWidth>700){
		if(position > 250){ con.fadeIn(500); 
		}
		else if(position < 250){ con.fadeOut(500); 
		}
	}else {
		con.css("display","none");
	}

});


$("#scroll").click(function(){
	$("html, body").animate({scrollTop: 0}, 1000);
});
