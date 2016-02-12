$(document).ready(function() {
  $(".alert").delay( 1000 ).fadeOut( 500 );
  $('label').click(function() {
    $('submit').submit();
  });
});
