//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .

/* global $ */

// hide bootstrap alert
$(function() {
  setTimeout(function(){
        $('.alert').slideUp(250);
    }, 4000);
});
