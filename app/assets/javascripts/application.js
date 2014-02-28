// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.jSlots
//= require jquery.easing.1.3
//= require_tree .


$(function() {

  $('span').click(function () {
    $(this).toggleClass('done');
    });

  $('form.fitness').submit(function(e) {

    e.preventDefault();

    $.post($(this).attr('action') + '.json', $(this).serialize() )
    .done(function(data) {
      console.log(data);
      $('form.fitness').before("<li class='content'><span>" +data.content+ "<a href='' data-method='delete' class='del' >✖︎</a></span></li>");
      $('form.fitness').find('input:visible').val('');
    });

  });

$('.tlt').click(function () {
    $('.tlt').textillate();
});


    $('.slot').jSlots({
        spinner : '#playBtn',
        number: 1,
        winnerNumber : 7,
        easing : 'easeOutSine'
    });

});
