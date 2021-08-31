// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require popper

// 入力フォーム
//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load',function(){
  // turbolinks:load:ページが読み込まれた時に発火
  // キーが離されたときに発生
  $('.form-js-input').on('keyup', function () {
    if ($(this).val()) {
      $(this).addClass('not-empty');
    } else {
      $(this).removeClass('not-empty');
    }
  });

  // トップページ
$(function() {
  // 一旦hide()で隠してフェードインさせる
  $('.top-message').hide().fadeIn('slow');
});

});



// aboutページ
// テキストアニメーション
const CLASSNAME = "-visible";
const TIMEOUT = 1500;

$(function(){
  setInterval(function(){
    $(".about-title").addClass(CLASSNAME);
    // 変数だと発火しない
    setTimeout(function(){
      $(".about-title").removeClass(CLASSNAME);
    }, TIMEOUT);
  }, TIMEOUT * 2);
});

// ページのトップに戻る
$(function() {
  $('#top a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

// サンクスメッセージ
$(function() {
  // 一旦hide()で隠してフェードインさせる
  $('.thanks-message').hide().fadeIn('slow');
});

// インクリメンタルサーチ
document.addEventListener('turbolinks:load',function(){
$('.search__form__input').on('keyup', function(e){
  Rails.fire($(".search__form")[0], "submit");
  });
});
