$(function() {
  Gallery.init();
});

var Gallery = function() {
  
  var NUM_ALBUMS_AT_ONCE = 14;

  var first_album = 1;
  var last_album = NUM_ALBUMS_AT_ONCE;
  var total_albums;

  var first_photo;
  var last_photo;

  var currently_sliding = false;
  
  return {
    
    init: function() {
      
      total_albums = $('#wrapper').data('numalbums')
      
      $('.photo_form').ajaxForm({
        success: function() {
          $('#update_success').show();
          $('#update_failure').hide();
        },
        
        error: function() {
          $('#update_failure').show();
          $('#update_success').hide();
        }
      });
      
      $('.gallery_image').live('click', this.load_image);
      $('.album').click(this.load_album);
      $('#next').live('click', this.next_thumbs);
      $('#previous').live('click', this.prev_thumbs);
      $('#gallery_up').click(this.gallery_up);
      $('#gallery_down').click(this.gallery_down);
      
      $('.album:first').click();
    },
    
    set_album_button_states: function() {
      if (first_photo == 1) {
        $('#previous img').attr('src', $('#previous img').attr('src').replace('arrow_left.jpg', 'arrow_left_ghosted.jpg'));
      } else {
        $('#previous img').attr('src', $('#previous img').attr('src').replace('_ghosted', ''));
      }

      if (last_photo == Gallery.album_size()) {
        $('#next img').attr('src', $('#next img').attr('src').replace('arrow_right.jpg', 'arrow_right_ghosted.jpg'));
      } else {
        $('#next img').attr('src', $('#next img').attr('src').replace('_ghosted', ''));
      }
    },

    set_album_nav_button_states: function() {
      if (first_album == 1) {
        $('#gallery_down img').attr('src', $('#gallery_down img').attr('src').replace('_on', '_off'));
      } else {
        $('#gallery_down img').attr('src', $('#gallery_down img').attr('src').replace('_off', '_on'));
      }

      if (last_album == total_albums) {
        $('#gallery_up img').attr('src', $('#gallery_up img').attr('src').replace('_on', '_off'));
      } else {
        $('#gallery_up img').attr('src', $('#gallery_up img').attr('src').replace('_off', '_on'));
      }    
    },
    
    load_image: function(){
      var img = $(this);
      $('.gallery_image img').removeClass('selected');
      img.find('img').addClass('selected');
      var id = img.attr('rel');
      var width = parseInt($('#photo_width_' + id).html());
      var height = parseInt($('#photo_height_' + id).html());

      $('#large_image').html('');
      if ($('#photo_data_' + id).html().replace(/\s*/, '') != '') {
        $('#large_image').append(
          $(document.createElement('div'))
            .attr('class', 'description')
            .append(
              $(document.createElement('p')).html($('#photo_data_' + id).html())
            )
          );
      }        
      $('#large_image').append($(document.createElement('img')).attr('src', $('#photo_filename_' + id).html()).css({ width: width, height: height }));
      $('#large_image').find('img').css('margin-top', (parseInt($('#large_image').css('height')) - height) / 2);
    },
    
    load_album: function() {      
      $.ajax({
        url: '/gallery/album/' + $(this).attr('rel'),
        success: function(html) {
          $('#thumbs').html(html);
          $('.gallery_image:first').click();
          Cufon.replace(['h2, h3'], { fontFamily: 'AvantGarde-Cnd' });
          first_photo = 1;
          last_photo = 13;
        }
      });
      $('.album').find('img').css('opacity', 1);
      $(this).find('img').css('opacity', 0.5);
      return false;
    },
    
    next_thumbs:  function() {
      if (currently_sliding) {
        return false;
      }
      var position = parseInt($('.thumb_holder .thumbs').css("left"));
      if (last_photo < Gallery.album_size()) {
        currently_sliding = true;
        var num_to_slide = Math.min(13, Gallery.album_size() - last_photo);
        $(".thumb_holder").find('.thumbs').animate(
          { left: position - num_to_slide * 57 },
          1500,
          function() {
            currently_sliding = false;
          }
        );
        first_photo = first_photo + num_to_slide;
        last_photo = last_photo + num_to_slide;
      }
      Gallery.set_album_button_states();
      return false;
    },
    
    
    prev_thumbs: function() { 
      if (currently_sliding) {
        return false;
      }
      var position = parseInt($('.thumb_holder').find('.thumbs').css("left"));
      if (first_photo > 1) {
        currently_sliding = true;
        var num_to_slide = Math.min(13, first_photo-1);
        $(".thumb_holder").find('.thumbs').animate(
          { left: position + num_to_slide * 57 },
          1500,
          function() {
            currently_sliding = false;
          }
        );
        first_photo = first_photo - num_to_slide;
        last_photo = last_photo - num_to_slide;
      }
      Gallery.set_album_button_states();
      return false;
    },
    
    gallery_up: function() {
      if (currently_sliding) {
        return false;
      }
      var position = parseInt($('.gallery_thumbs').css("top"));
      if (last_album < total_albums) {
        currently_sliding = true;
        num_to_slide = Math.min(14, total_albums - last_album);
        $('.gallery_thumbs').animate(
          { top: position - num_to_slide * 31 },
          1500,
          function() {
            currently_sliding = false;
          }
        );
        first_album = first_album + num_to_slide;
        last_album = last_album + num_to_slide;
      }
      Gallery.set_album_nav_button_states();
      return false;
    },
    
    gallery_down: function() {
      if (currently_sliding) {
        return false;
      }
      var position = parseInt($('.gallery_thumbs').css("top"));
      if (first_album > 1) {
        currently_sliding = true;
        num_to_slide = Math.min(14, first_album-1);
        $('.gallery_thumbs').animate(
          { top: position + num_to_slide * 31 },
          1500,
          function() {
            currently_sliding = false;
          }
        );
        first_album = first_album - num_to_slide;
        last_album = last_album - num_to_slide;
      }
      Gallery.set_album_nav_button_states();
      return false;
    },
    
    album_size: function() {
      return $('#thumbs .gallery_image').size();
    }
    
  }
  
}();