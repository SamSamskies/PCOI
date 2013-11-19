$(document).ready(function() {

	GoogleMap.initMap();
	Welcome.initListeners();
	Welcome.fetchJobs();

	// how far the navigation is from the top of the page
	stickyNavTop = $("#nav").offset().top;
	stickyNav();

	// and call it again when the user scrolls
	$(window).scroll(function() {
	    stickyNav();
	});

});

var Welcome = {
  initListeners: function() {
    $('form#interests').on('submit', function(e) {
      Welcome.fetchJobs();
      e.preventDefault()
    });


    $("#search-results").on('click', '.actions', function() {
    	Welcome.fetchJobPage($(this).data('id'));
    });

    $("#show-menu").on('click', function() {
    	$('#top-menu').toggle();
    });
  },

  fetchJobs: function() {
    $.ajax({
      url: '/jobs',
      data: {
              sector_id: $( "#sectors option:selected" ).val(),
              region_id: $( "#regions option:selected" ).val()
            }
    });
  },

  fetchJobPage: function(id) {
  	$.ajax({
  		url: '/jobs/' + id
  	}).done(function(response) {
  		$('.modal-body').html(response);

  	})
  }
}

var stickyNavTop = 0;
// function to create a sticky navigation
function stickyNav() {
	// how much the user has scrolled
	var scrollTop = $(window).scrollTop();

	// compare the navigation distance vs scrolled distance; if scrolled distance is greater, make the nav "sticky"
	if (scrollTop > stickyNavTop) {
	    $("#nav").addClass("sticky");
	} else {
	    $("#nav").removeClass("sticky");
	}
};