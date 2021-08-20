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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// 入力フォーム
//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load',function(){
  // console.log("test")
  // デベロッパーツールで確認できる
  // キーが離されたときに発生
  $('.form-js-input').on('keyup', function () {
    if ($(this).val()) {
      $(this).addClass('not-empty');
    } else {
      $(this).removeClass('not-empty');
    }
  });
});

// トップページ
$(function() {
  // 一旦hide()で隠してフェードインさせる
  $('.top-message').hide().fadeIn('slow');
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

// 画像拡大
// $(function() {
//   $('.expand-image').click(function() {
//     console.log("画像拡大");
//     var imgSrc = $(this).children().attr('src');
//       $('.big-img').children().attr('src', imgSrc);
//     // クリックされた時にsrcにimage-urlを代入
//     // $('.big-img').children().attr('src', $(this).data("imageUrl"));でも同じ
//     $('.modal').fadeIn();
//     $('body,html').css('overflow-y', 'hidden');
//     // 画像が画面からはみ出る場合は非表示にする。画面のブレ防止のため。
//     return false
//   });
//   $('.close-btn').click(function() {
//     $('.modal').fadeOut();
//     $('body,html').css('overflow-y', 'visible');
//     return false
//   });
// })
$(function() {
    console.log("画像拡大");
  $('.expand-image').click(function() {
    // var imgSrc = $(this).children().attr('src');
    // imgSrc.width(700);
    // console.log({imgSrc})
      // $('.big-img').children().attr('src', imgSrc);
      $('.big-img').css('display', 'block')
      // display: none;をblockに変更する
      // $('.big-img').append(`<img src="${imgSrc}" width="700" height="700">`);
    // クリックされた時にsrcにimage-urlを代入
    // $('.big-img').children().attr('src', $(this).data("imageUrl"));でも同じ
    $('.modal').fadeIn();
    $('body,html').css('overflow-y', 'hidden');
    // 画像が画面からはみ出る場合は非表示にする。画面のブレ防止のため。
    return false
  });
  $('.close-btn').click(function() {
    $('.modal').fadeOut();
    $('body,html').css('overflow-y', 'visible');
    return false
  });
})

// 検索
document.addEventListener('turbolinks:load',function(){
$('.search__form__input').on('keyup', function(e){
  Rails.fire($(".search__form")[0], "submit");
  });
});

// 共感、応援
$(".sympathy-btn").mousedown(function(){
  console.log("test")
  // マウスのボタンが押されたときに発生するイベント
  // 同じようなイベントとしてマウスが押されて離されたときに発生する click イベントがある
  $(this).html("sympathy.jpeg").velocity({
    // velocity:jQueryのプラグイン。高機能で非常に軽快なアニメーションをする。
    backgroundColorRed : "0",
    translateY: "-1.5rem",
    rotateZ: "-10deg"
  }, 100, "easeOut").velocity({
    rotateZ: "8deg",
  }, 150).velocity({
    translateY: "0",
    rotateZ: "0"
  }, 600, "easeOutBounce");

  $("+ .shadow", this).velocity({
    scale: "1.3",
    opacity: "1"
  }, 150).velocity("reverse", 600, "easeOutBounce");

});

$(".cheer-btn").mousedown(function(){
  $(this).html("Recommended").velocity({
    backgroundColorRed : "0",
    translateY: "-1.5rem",
    rotateZ: "-10deg"
  }, 100, "easeOut").velocity({
    rotateZ: "8deg",
  }, 150).velocity({
    translateY: "0",
    rotateZ: "0"
  }, 600, "easeOutBounce");

  $("+ .shadow", this).velocity({
    scale: "1.3",
    opacity: "1"
  }, 150).velocity("reverse", 600, "easeOutBounce");

});