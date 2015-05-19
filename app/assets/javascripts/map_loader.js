// JS related to maps goes in here

$(function() {

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
      lat = pos.coords.latitude;
      lng = pos.coords.longitude;
       // Now set the value of the current location to the users lat/long
       $('.current_location').val(lat + ',' +lng)
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