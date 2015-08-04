$(function () {
    /* BOOTSNIPP FULLSCREEN FIX */
    if (window.location == window.parent.location) {
        $('#back-to-bootsnipp').removeClass('hide');
    }
    
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $('#fullscreen').on('click', function(event) {
        event.preventDefault();
        window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
    });
    $('a[href="#cant-do-all-the-work-for-you"]').on('click', function(event) {
        event.preventDefault();
        
    });
    
    $('[data-command="toggle-search"]').on('click', function(event) {
        event.preventDefault();
        $(this).toggleClass('hide-search');
        
        if ($(this).hasClass('hide-search')) {        
            $('.c-search').closest('.row').slideUp(100);
        }else{   
            $('.c-search').closest('.row').slideDown(100);
        }
    });

    // $('[data-command="toggle-form"]').on('click', function(e) {
    //   e.preventDefault();
    //   $(this).toggleClass('hide-form');

    //   if ($(this).hasClass('hide-form')) {
    //     $('.c-form').closest('.row').slideUp(100);
    //   } else{
    //     $('.c-form').closest('.row').slideDown(100);
    //   }
    // })

    
    $("form").on("submit", function(e) {
      e.preventDefault();
      var fname = $("#contact-fname").val();
      var lname = $("#contact-lname").val();
      var email = $("#contact-email").val();
      var address = $("#contact-address").val();
      var number = $("#contact-number").val();
      var id = Date.now()
      $("<li class='list-group-item'> \
          <div class='col-xs-12 col-sm-3'> \
              <img src='avatar.png' alt='"+fname+" "+lname+"' class='img-responsive img-circle' /> \
          </div> \
          <div class='col-xs-12 col-sm-9'> \
              <span class='name'>"+fname+" "+lname+"</span><br/> \
              <span class='glyphicon glyphicon-map-marker text-muted c-info' data-toggle='tooltip' title='"+address+"'></span> \
              <span class='visible-xs'> <span class='text-muted'>"+address+"</span><br/></span> \
              <span class='glyphicon glyphicon-earphone text-muted c-info' data-toggle='tooltip' title='"+number+"'></span> \
              <span class='visible-xs'> <span class='text-muted'>"+number+"</span><br/></span> \
              <span class='fa fa-comments text-muted c-info' data-toggle='tooltip' title='"+email+"'></span> \
              <span class='visible-xs'> <span class='text-muted'>"+email+"</span><br/></span> \
          </div> \
          <div class='clearfix'></div> \
      </li>").appendTo("ul#contact-list");
      $('[data-toggle="tooltip"]').tooltip();
      // $('#contact-list').searchable({
      //   searchField: '#contact-list-search',
      //   selector: 'li',
      //   childSelector: '.col-xs-12',
      //   show: function( elem ) {
      //       elem.slideDown(100);
      //   },
      //   hide: function( elem ) {
      //       elem.slideUp( 100 );
      //   }
      // });
      $("#contact-fname").val("");
      $("#contact-lname").val("");
      $("#contact-email").val("");
      $("#contact-address").val("");
      $("#contact-number").val("");
    });
    
    $('#contact-list').searchable({
        searchField: '#contact-list-search',
        selector: 'li',
        childSelector: '.col-xs-12',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    });
});
