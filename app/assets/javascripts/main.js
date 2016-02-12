$(document).ready(function() {
  $(".alert").delay( 1000 ).fadeOut( 500 );
  $('label').on('change', function() {
    $('form').submit();
  });
});
