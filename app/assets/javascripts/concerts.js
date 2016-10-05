function showLocations(data) {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        data[data.length] = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
          infowindow: "You!"
        };
        markers = handler.addMarkers(data);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });
  } else {
      alert("Geolocation is not supported by this browser.");
      markers = handler.addMarkers(data);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
  }
}

function createGmap(data) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {},
      internal: {id: 'map'}
    },
    function() {
      showLocations(data);
    }
  );
};

function loadAndCreateGmap() {
  // Only load map data if we have a map on the page
  if ($('#map').length > 0) {
    // Access the data-concert-id attribute on the map element
    var concertId = $('#map').attr('data-concert-id');

    $.ajax({
      dataType: 'json',
      url: '/concerts/map_location',
      method: 'GET',
      data: '',
      success: function(data) {
        createGmap(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

// Create the map when the page loads the first time
$(document).on('ready', loadAndCreateGmap);
// Create the map when the contents is loaded using turbolinks
// To be 'turbolinks:load' in Rails 5
$(document).on('page:load', loadAndCreateGmap);
