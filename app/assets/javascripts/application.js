// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function () {
$('[data-toggle="tooltip"]').tooltip()

// $( "#browse" ).hover(function() {

// });

$( "#pic" ).hover(function() {
	$(this).css("cursor", "pointer");
});

$( "#cart" ).mouseover(function() {
	$(this).css("cursor", "pointer");
	$(".btn").css({
		// 'font-size' : '30px',
		'color' : 'red',
	});
	//$(".bg").css("opacity", "0.4");
	$(this).mouseleave(function(){
		$(".btn").css({
			// 'font-size' : '',
			'color' : '',
		});
		//$(".bg").css("opacity", "1");
	})
});

$( "#copy" ).mouseover(function() {
	$(this).css("cursor", "pointer");
	$("#m").css({
		'background-color' : '#FCF8E3',
		'padding' : '0.2em',
		'color' : 'red',
	});
	$(this).mouseleave(function(){
		$("#m").css({
			'background-color' : '',
			'padding' : '',
			'color' : '',
		});
	})	
});

})

function myFace() {
window.open("https://www.facebook.com/sharer/sharer.php?app_id=209034415775655&sdk=joey&u=https%3A%2F%2Fwww.picme.herokuapp.com/%2F&display=popup&ref=plugin", "_blank", "toolbar=no, scrollbars=no, resizable=no, top=150, left=400, width=500, height=500");
}

