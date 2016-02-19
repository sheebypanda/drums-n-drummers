var ready = function() {
  $('label').on('change', function() {
    $('form').submit();
  });

  $(function () {
    $('[data-toggle="popover"]').popover('show')
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
