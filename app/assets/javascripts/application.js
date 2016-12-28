// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() {
  $(function() { $('div.rateit, span.rateit').rateit(); });
  $(function() {
    $('#rateit_star1').rateit({min: 0, max: 10, step: 1});
    $('#rateit_star1').bind('rated', function(e) {
      var ri = $(this);
      var value = ri.rateit('value');
      alert(value);
      ri.rateit('readonly', true);
      $('#star_rs').val(value);
      $('#new_rate').submit();
    });
  });
});
