$(document).ready(function() {

	GoogleMap.initMap();
    Welcome.initListeners();
});

var Welcome = {
  initListeners: function() {
    $('form#interests').on('submit', function(e) {
      $.ajax({
        url: '/jobs',
        data: {
                sector_id: $( "#sectors option:selected" ).val(),
                region_id: $( "#regions option:selected" ).val()
              }
      });
      e.preventDefault()
    });

    $("#search-results").on('click', '.actions', function() {
    	document.location.href="/jobs/"+$(this).data('id');
    	
    });

    /*
    $("#search-results").on('click', '.actions', function() {
    	console.log('modal show');
    	$('#modal').show().slideUp();
    });
	*/
	
  }
}

