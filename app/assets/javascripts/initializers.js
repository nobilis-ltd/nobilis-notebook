// contains helper methods and initializers

// start tooltips
$(document).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip();
})

// paloma initializers
$(document).on('turbolinks:load', function() {
  Paloma.start();
})

// Add paloma support when turbolinks restores pages
// from cache
$(document).on('page:restore', function(){
  Paloma.start();
})