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
  } else {
    $('#intro-popup').attr('id', 'home-popup')
  }

  // If the user chooses guest then set a cookie to not show again
  $('.guest-user').on('click', function(e){
    e.preventDefault();
    document.cookie = "rr_visited=true;"
    $.magnificPopup.close()
  });

  // If you click the icon load the app intro again
  $('.inline-popup').magnificPopup({
    type: 'inline'
  });

  $('.ajax-popup').magnificPopup({
    type: 'ajax'
  });

  // Hide alert notices after a short time
  if($('.notice').length) {
    setTimeout(function(){ 
      $('.notice').fadeOut().remove();
    }, 3000);
  }

  // Hide the location input as display it on the map
  $('.location-input input').hide();

  // Some simple sho/hide toggles for various bits of content
  $('.user-tasks, .research-reports').hide();
  $('.settings').on('click', function() {
    console.log('clicked');
    $('.user-tasks').slideToggle();
    e.preventDefault();
  });
  $('.research-paper-toggle').on('click', function(e) {
    $('.research-reports').slideToggle();
    e.preventDefault();
  });

});

// Animate your turbolinks

document.addEventListener('page:change', function() {
  document.getElementById('main').className += 'animated fadeIn';
});
document.addEventListener('page:fetch', function() {
  document.getElementById('main').className += 'animated fadeOut';
});
