$(document).ready(function(){
	var owl = $('.owl-carousel');
    owl.owlCarousel({
    	items:3,
       	loop:true,
        margin:10,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true
	});
    $('.play').on('click',function(){
    	owl.trigger('play.owl.autoplay',[3000])
	})
	$('.stop').on('click',function(){
    	owl.trigger('stop.owl.autoplay')
	})
	$("#exampleCheck1").click(function(){
		if($("#exampleCheck1").is(':checked')){
	     	$('#exampleInputPassword').get(0).type = 'text';
		}else{
	    	$('#exampleInputPassword').get(0).type = 'password';
	    }
	})
	$("#password-btn").click(function(){
		if($("#exampleInputPassword").val() == false){
			$("#error").html("<b>* Veuillez inserer votre mot de passe</b>").css("color", "#DC3545");
		}else{
			$("#error").hide();
			$("#password").hide();
			$("#email").show();
		}
	})
	$(".fa-arrow-left").click(function(){
		$("#email").hide();
		$("#password").show();
		$("#exampleInputPassword1").val("");
	})
});