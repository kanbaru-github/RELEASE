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
    $('.top-message').hide().fadeIn(1500);
    // 1500ミリ秒
  });

  // タブメニュー
  $(function() {
      // ↓タブをクリックした時の処理↓
      $('.tab').click(function(){
          // ↓現在アクティブなタブを切り替え↓
          $('.tab-active').removeClass('tab-active');
          // ↓タブをアクティブにする↓
          $(this).addClass('tab-active');
          // ↓現在アクティブなタブの中身を非表示
          $('.box-show').removeClass('box-show');
          // ↓クリックしたタブから順番を取得↓
          const index = $(this).index();
          // ↓クリックしたタブと同じ順番のコンテンツを表示↓
          $('.tabbox').eq(index).addClass('box-show');
      });
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

// 落ち葉をランダムサイズで生成してDOMに追加する
window.addEventListener('DOMContentLoaded', ()=> {
  // コンテナを指定
  const container = document.querySelector('.leaves-container');

  // 葉っぱを生成する関数
  const createLeaf = (leafClass, minSizeVal, maxSizeVal) => {
    const leafEl = document.createElement('span');
    leafEl.className = `leaf ${leafClass}`;
    const minSize = minSizeVal;
    const maxSize = maxSizeVal;
    const size = Math.random() * (maxSize + 1 - minSize) + minSize;
    leafEl.style.width = `${size}px`;
    leafEl.style.height = `${size}px`;
    leafEl.style.left = Math.random() * 100 + '%';
    container.appendChild(leafEl);

    // 一定時間が経てば葉っぱを消す
    setTimeout(() => {
      leafEl.remove();
    }, 8000);
  }

  // 葉っぱを生成する間隔をミリ秒で指定する
  // createLeafの引数には、'クラス名', '最小サイズ', '最大サイズ'を渡す
  setInterval(createLeaf.bind(this, 'leaf-1', 30, 50), 1000);
  setInterval(createLeaf.bind(this, 'leaf-2', 30, 50), 1000);
  setInterval(createLeaf.bind(this, 'leaf-3', 30, 50), 1000);
});
