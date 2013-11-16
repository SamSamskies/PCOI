var GoogleMap = {
  initMap: function() {
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
}