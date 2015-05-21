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
      $('.notice').fadeOut().remove();
    }, 3000);
  }

  $('.location-input input').hide();

  $('.user-tasks').hide();
  $('.settings').on('click', function() {
    console.log('clicked');
    $('.user-tasks').slideToggle();
    e.preventDefault();
  });

  $('.research-reports').hide();
  $('.research-paper-toggle').on('click', function(e) {
    $('.research-reports').slideToggle();
    e.preventDefault();
  });

});
