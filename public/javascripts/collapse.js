$(document).ready(function(){

	$("#login").hide();
	$(".toggle_login").show();
	
	$('.toggle_login').click(function(){
	$("#login").slideToggle();
	});	

	$("#signup").hide();
	$(".toggle_signup").show();
	
	$('.toggle_signup').click(function(){
	$("#signup").slideToggle();
	});	
});
