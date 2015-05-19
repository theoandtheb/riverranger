// Call our site specific JQuery in here

$(function() {
  
  // Auto load a popup if it exists on the page and the cookie hasn't been set
  if(document.cookie.indexOf("rr_visited=true") == -1) {
    console.log('cookie not set')
    if($('#intro-popup').length) {
      $.magnificPopup.open({
        items: {
          src: '#intro-popup' 
        },
        type: 'inline',
        closeOnContentClick: false,
        closeOnBgClick: false,
        showCloseBtn: false
      });
    } 
  }

  // If the user chooses guest then set a cookie to not show again
  $('.guest-user').on('click', function(e){
    e.preventDefault();
    document.cookie = "rr_visited=true;"
    $.magnificPopup.close()
  });

  // Hide alert notices after a short time
  if($('.notice').length) {
    setTimeout(function(){ 
      $('.notice').fadeOut();
    }, 3000);
  }

  $('.location-input input').hide();

  // On an observation page get the users current location
  if('geolocation' in navigator){
    var options = {  
       enableHighAccuracy: false, 
       timeout: 5000,  
       maximumAge: 0 
    };
    navigator.geolocation.getCurrentPosition(success, error, options); 
    function success(pos){
      console.log('I got your location')
      currentLat = pos.coords.latitude;
      currentLng = pos.coords.longitude;
       // Now set the value of the current location to the users lat/long
       $('.set_current_location').val(currentLat + ',' +currentLng)
    }
    function error(err){
       console.log('Error: ' + err + ' :('); // alert the error message
    }
    // var options = {
    //   zoom: 3
    // }
    // // Set the map
    // var L.map('map').setView([lat, lng], 3);
    // // Add the tile layers
    // L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    //     attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    // }).addTo(map);
    // L.marker([lat,lng]).addTo(map);
  } else {
    console.log('Geoocation not defined')
  }

});