$(document).ready(function() {

	GoogleMap.initMap();
  Welcome.initListeners();
  Welcome.fetchJobs();

});

var Welcome = {
  initListeners: function() {
    $('form#interests').on('submit', function(e) {
      Welcome.fetchJobs();
      e.preventDefault()
    });

    $("#search-results").on('click', '.actions', function() {
    	document.location.href="/jobs/"+$(this).data('id');

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
  }

    /*
    $("#search-results").on('click', '.actions', function() {
    	console.log('modal show');
    	$('#modal').show().slideUp();
    });
	*/
}

