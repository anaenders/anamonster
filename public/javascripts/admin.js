$.editable.addInputType('checkbox', {
  element: function(settings, original) {
    $(this).append('<input type="checkbox"/>');
    var hidden = $('<input type="hidden"/>');
    $(this).append(hidden);
    return(hidden);
  },

  submit: function(settings, original) {
    settings = $.extend({ checkbox: {
      trueValue: '1',
      falseValue: '0'
    }}, settings);

    if ($(':checkbox', this).is(':checked')) {
      $(':hidden', this).val(settings.checkbox.trueValue);
    } else {
      $(':hidden', this).val(settings.checkbox.falseValue);
    }
  },

  content: function(data, settings, original) {
    settings = $.extend({ checkbox: {
      trueValue: 'Yes',
      falseValue: 'No'
    }}, settings);

    if (data == settings.checkbox.trueValue) {
      $(':checkbox', this).attr('checked', 'checked');
    } else {
      $(':checkbox', this).removeAttr('checked');
    }
  }
});

$(function() {
  Admin.init();
});

var Admin = function() {
  
  var new_photo_form_html;
  var num_blog_photos = 1;

  return {
    
    init: function() {
      
      $('.editable, .editable_boolean').each(function() {
        $(this).css('cursor', 'pointer');
      });
      
      $('.editable').editable('/admin/update_field', {
          id        : 'field_id',
          indicator : '<img src="/images/spinner-16.gif" width="16" height="16"> Saving...',
          tooltip   : 'Click to edit...',
          submitdata : function() {
            return { 'type' : $(this).data('type') };
          }
        }
      );
      
      $('.editable_boolean').editable('/admin/update_field', {
          id        : 'field_id',
          cancel    : 'Cancel',
          submit    : 'OK',
          type      : 'checkbox',
          indicator : '<img src="/images/spinner-16.gif" width="16" height="16"> Saving...',
          tooltip   : 'Click to edit...',
          submitdata : function(value, settings) {
            return { 'type' : $(this).data('type'), is_bool : 1 };
          }
        }
      );
      
      $('.new_photo_field').live('click', this.add_blog_photo_field);
      
      new_photo_form_html = $('#js_new_photo_form').html();
      Admin.setup_new_photo_form();
    },
    
    setup_new_photo_form: function() {
      $('#new_photo_form').ajaxForm({
        success: function(response) {
          $('.edit_photos').append(response);
          $('#js_new_photo_form').html(new_photo_form_html);
          Admin.setup_new_photo_form();
        },
        error: function(response) {
          $('#js_new_photo_errors').html(response.responseText);
        }
      });
    },
    
    add_blog_photo_field: function() {
      num_blog_photos++;
      $.ajax({
        url: '/blog/new_photo_field',
        data: { num : num_blog_photos },
        success: function(html) {
          $('#new_photos').before(html);
        }
      });
      return false;
    }
    
  }
  
}();