// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.raty.js
//= require bootstrap-editable
//= require bootstrap-editable-rails
//= require jquery.bind_with_delay
//= require yt_player
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	$.fn.editable.defaults.mode = 'inline';
	
	$('.editable').editable();

	$('#myDiv').children().attr('readonly', true);






	//$('#sectionname').editable({
    //type: 'text',
    //title: 'Enter section',
    //success: function(response, newValue) {
      //  Section.set('sectionname', newValue); //update backbone model
    //}
});

//function createVideoSection(id)
  //{
    
    //var newRow = $('<tr id="hello"><td colspan="2"> hello </td> </tr>');
    //var childOneOfTr = $('<td colspan="2"></td>');
    //var childTwoOfTr = $('<div class="collapse" id="collapseExample_' +id +'></div>');
    //var childThreeOfTr = $('<div class="well">hlhlhlhl</div>')
    //$('#section_'+id).after( newRow );

  //}
//	$('input[type=submit]').on('click', function(event){
//		var form = $(this).parent('form');
//		event.preventDefault();
//		$.ajax({

//			type: "PUT",
//			url: form.attr('action'),
//			data: form.serialize(),
//			success: function(data){
//				console.log("hi there")
//			},
//			error: function(data){
//				console.log("there is some error")
//			}, 
//			dataType: 'JSON'
//		});

//	});


//});