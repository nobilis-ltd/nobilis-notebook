// contains helper methods and initializers

// start tooltips
$(document).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip();
})