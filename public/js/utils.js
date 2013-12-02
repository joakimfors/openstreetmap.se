/*$(document).ready(function() {
	window.header = document.getElementById('header');
	window.header.top_offset = window.header.getBoundingClientRect().top;
	window.container = document.getElementById('container');

	$(window).scroll(function() {
		var header_top = window.container.getBoundingClientRect().top + window.header.top_offset;
		if (header_top <= 0 && window.header.style.position != 'fixed') {
			window.header.style.position = 'fixed';
			window.header.style.top = '-' + window.header.top_offset + 'px';
		} else if (header_top > 0 && window.header.style.position != 'absolute') {
			window.header.style.position = 'absolute';
			window.header.style.top = '';
		}
	});
});*/





// getPageScroll() by quirksmode.com
function getPageScroll() {
    var xScroll, yScroll;
    if (self.pageYOffset) {
      yScroll = self.pageYOffset;
      xScroll = self.pageXOffset;
    } else if (document.documentElement && document.documentElement.scrollTop) {
      yScroll = document.documentElement.scrollTop;
      xScroll = document.documentElement.scrollLeft;
    } else if (document.body) {// all other Explorers
      yScroll = document.body.scrollTop;
      xScroll = document.body.scrollLeft;
    }
    return new Array(xScroll,yScroll)
}

// Adapted from getPageSize() by quirksmode.com
function getPageHeight() {
    var windowHeight
    if (self.innerHeight) { // all except Explorer
      windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) {
      windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
      windowHeight = document.body.clientHeight;
    }
    return windowHeight
}

function getDocHeight() {
  return Math.max(
    document.body.scrollHeight, document.documentElement.scrollHeight,
    document.body.offsetHeight, document.documentElement.offsetHeight,
    document.body.clientHeight, document.documentElement.clientHeight
  );
}


/*$(document).ready(function() {
  //console.log(getPageScroll());
  //console.log(getPageHeight());
  //console.log(getDocHeight());

  $(window).scroll(function() {
    //console.log(getPageScroll());
    //console.log(getPageHeight());
    //console.log(getDocHeight());

    //var viewport_height = getPageHeight();
    //var body_offset = document.body.getBoundingClientRect().top;
    //var body_height = document.body.getBoundingClientRect().height;
    //var b = document.body.getBoundingClientRect();
    //console.log(body_offset);

    var bg_height = 2560;
    var max_offset = bg_height - getPageHeight();

    //console.log("bg offset: " + body_offset / (body_height - viewport_height) + "px");
    //console.log("bg offset: " + b.top / (b.height - viewport_height) + "px");
    //console.log("bg offset: " + (max_offset * getPageScroll()[1]) / (getDocHeight() - getPageHeight()) + "px");
    document.body.style.backgroundPosition = "0px " + (- max_offset * getPageScroll()[1]) / (getDocHeight() - getPageHeight()) + "px"
  });
})*/
