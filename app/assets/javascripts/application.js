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
//= require jquery.ui.all
//= require jquery_ujs
//= require turbolinks
//= require jquery.jSlots
//= require jquery.easing.1.3
//= require flowtype
//= require_tree .


$(function() {

  // $('span').click(function () {
  //   $(this).toggleClass('done');
  //   });

  $('form.fitness').submit(function(e) {

    e.preventDefault();

    $.post($(this).attr('action') + '.json', $(this).serialize() )
    .done(function(data) {
      console.log(data);
      $('form.fitness').before("<li class='content'><span>" +data.content+ "<a href='' data-method='delete' class='del' >✖︎</a></span></li>");
      $('form.fitness').find('input:visible').val('');
    });

  });
    // $('.slide').slideDown(700, 'linear');

    $('.slot').jSlots({
        spinner : '#playBtn',
        number: 1,
        winnerNumber : 7,
        easing : 'easeOutSine'
    });

    $('.slot li a').hover(function (){
      $('.doit').toggleClass('showit');
      $(this).toggleClass('bam');
    });

    $('.un').hover(function (){
      $('.subnav').stop(true, true).slideDown("fast");
    }, function() {
      $('.subnav').slideUp("fast");
    }
    );

    $('.bout').hover(function (){
      $('.sbnav').stop(true, true).slideDown("fast");
    }, function() {
      $('.sbnav').slideUp("fast");
    }
    );

    $('a.poop').click(function () {
      alert("Six for you Glen Coco! You go Glen Coco. Take 6 points for your hard work");
      });

});
