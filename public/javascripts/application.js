$(function(){
	// Hover on/off for navigation.
	$('.nav_links img, .footer_links img').each(function(){
		if ($(this).attr('src').match('_off')){
			$(this).hover(
				function() {
					$(this).attr('src', $(this).attr('src').replace('_off', '_hover'));
				},
				function() {
					$(this).attr('src', $(this).attr('src').replace('_hover', '_off'));					
				}
			);
		}
	});
	
	// Showcase
	var showing = null;
  $('.small_image').click(function(){
    var num = $(this).attr('rel');
    if (showing == num) {
      $('#showcase_' + num).slideToggle('slow');
      showing = null;
    } else {
      $('#showcase_' + showing).slideToggle('slow');
      $('#showcase_' + num).slideToggle('slow');  
      showing = num;
    }
    return false;
  });
  
  $('.small_image').hover(
    function() { $(this).addClass('hover'); },
    function() { $(this).removeClass('hover'); }
  );
  
  //Contact
  $('#error, #success').click(function() {
    $('#error').hide();
    $('.message').show();
    $('#contact_message').show();
  });
});
