var ready = function() {
  $('label').on('change', function() {
    $('form').submit();
  });

  $(function () {
    $('[data-toggle="popover"]').popover({
    container: 'img'
  })
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);
