Cufon.replace(['h2, #search_features h3'], { fontFamily: 'AvantGarde-Cnd' });
Cufon.replace(['#blog_container h3'], { fontFamily: 'AvantGarde' });

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
	$('.large_image').css("display", "none");
  $('.small_image').click(function(){
    var num = $(this).attr('rel');
    if (showing == num) {
      $('#showcase_' + num).slideToggle('slow');
      $('#showcase_' + num + ' .project_description').hide();
      showing = null;
    } else {
      $('#showcase_' + showing).slideToggle('slow');
      $('#showcase_' + showing + ' .project_description').hide();
      $('#showcase_' + num).slideToggle('slow', function() {
        $('#showcase_' + num + ' .project_description').fadeIn(1000);
        showing = num;
      }); 
    }
    return false;
  });
  
  $('.small_image img').hover(
    function() { $(this).addClass('hover'); },
    function() { $(this).removeClass('hover'); }
  );
  
  //Contact
  $('#error, #success').click(function() {
    $('#error').hide();
    $('.message').show();
    $('#contact_message').show();
  });
  
  //Blog comments  
  $('.show_hide a').click(function() {
    if ($(this).html() == 'hide comments') {
      $(this).html('show comments');
      $('.comment[rel="' + $(this).attr('rel') + '"]').hide();
    } else {
      $(this).html('hide comments');
      $('.comment[rel="' + $(this).attr('rel') + '"]').show();
    }
    return false;
  });
  
  $('a.reply_link').click(function() { 
    $('.textfield_wrapper[rel="' + $(this).attr('rel') + '"]').toggle();
    return false;
  });
});
