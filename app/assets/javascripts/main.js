var ready = function() {
  $('label').on('change', function() {
    $('form').submit();
  });
  $(".alert").delay( 1000 ).fadeOut( 500 );
};

$(document).ready(ready);
$(document).on('page:load', ready);
