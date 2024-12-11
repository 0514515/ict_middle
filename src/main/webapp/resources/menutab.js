$(function(){
	$("#profileArea")
		.on("mouseenter",function(){
			$(this).css("cursor", "pointer");
		})
		.on("mouseleave",function(){
			$(this).css("cursor", "default");
		})
		.on("click",function(){
			window.location.replace("/member/detail");
		});
})