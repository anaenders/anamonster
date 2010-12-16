$(function() {
  ResizingBackground.init();
	// ShowBackground.init();
});

// var ShowBackground = function() {
// 	
// 	var backgroundFilePrefix = "/images/background";
// 	var index = Math.floor(Math.random() * 6) + 1;
// 	var img = backgroundFilePrefix + index + ".jpg"
// 			
// 	return {
// 		init: function() {
// 			var img = backgroundFilePrefix + index + ".jpg";
// 			$('#background img').attr('src', img);
// 			$('#background img').fadeIn();
// 			$(window).trigger('ResizingBackground');
// 		}
// 	}
// }();

var ResizingBackground = function() {

	var BASE_WIDTH = 1000;
	var BASE_HEIGHT = 667;
	var WIDTH_FROM_HEIGHT = BASE_WIDTH / BASE_HEIGHT;
	var HEIGHT_FROM_WIDTH = BASE_HEIGHT / BASE_WIDTH;
	
  return {    
    init: function() {
      $(window).resize(this.resize_background);
      this.resize_background();
    },
    
    resize_background: function() {
			var current_width_ratio = $(window).width() / $(window).height();
			if (current_width_ratio > WIDTH_FROM_HEIGHT) {
				$('#background img').css({ width : $(window).width(), height : $(window).width() * HEIGHT_FROM_WIDTH });
			} else {
				$('#background img').css({ height : $(window).height(), width : $(window).height() * WIDTH_FROM_HEIGHT });
			}
    }
  }
}();