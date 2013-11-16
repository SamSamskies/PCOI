$(document).ready(function() {

	//global variable _map stores map object
	_map = initializeMap();
	loadData();

	$('.selectAll').on('click', function() {
		selectAll(this);
	});
	$('.selectNone').on('click', function() {
		selectAll(this);
	});

  form = $('form#interests')
  form.on('submit', function(e) {
    $.ajax({
      url: '/jobs',
      data: {
              sector_id: $( "#sectors option:selected" ).val(),
              region_id: $( "#regions option:selected" ).val()
            },
    })
    e.preventDefault()
  })

});

function initializeMap() {
	//return map object

  var mapOptions = {
    zoom: 2,
    center: new google.maps.LatLng(0,0),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
/*

	var mapOptions = {
          center: new google.maps.LatLng(42.2353083, -71.0012016),
          zoom: 2,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          styles: [ { "featureType": "landscape.natural.terrain" },{ "elementType": "geometry.fill", "stylers": [ { "saturation": 6 }, { "gamma": 0.28 }, { "lightness": 24 }, { "hue": "#ff0077" }, { "weight": 0.8 } ] },{ "featureType": "road.local", "stylers": [ { "visibility": "simplified" } ] } ]

        };

    var map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
*/
    return map;
}

function loadData() {
	console.log('loadData');
}

function selectAll(e) {
	$(e).siblings()
		.find('input')
		.each(function(k, v) {
			v.checked = true;
		});
}
function selectNone(e) {
	$(e).siblings()
		.find('input')
		.each(function(k, v) {
			v.checked = false;
		});
}

