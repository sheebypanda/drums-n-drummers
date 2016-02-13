var ready = function() {
  alert();
  $('label').on('change', function() {
    $('form').submit();
    alert();
  });
  $(".alert").delay( 1000 ).fadeOut( 500 );
};

$(document).ready(ready);
$(document).on('page:load', ready);
