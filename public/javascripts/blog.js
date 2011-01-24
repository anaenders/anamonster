$(function() {
  Blog.init();
});

var Blog = function() {
  
  return {
    
    init: function() {
      $('#blog_comment_form').ajaxForm({
        error: function(response) {
          $('#comment_errors_' + $('#comment_blog_id').val()).html(response.responseText);
          Recaptcha.reload();
        },
        
        success: function(response) {
          var blog_id = $('#comment_blog_id').val();
          $('#new_blog_drop_' + blog_id).before(response);
          $('#comment_count_' + blog_id).html($('.comment[rel="' + blog_id + '"]').size());
          $('#comment_errors_' + blog_id).html('');
          $('.comment[rel="' + blog_id + '"]').show();
          $('.textfield_wrapper[rel="' + blog_id + '"] .reply_content').val('');
          Recaptcha.reload();
        }
      });
    }
    
  }
  
}();