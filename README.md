# README

## サイト概要
*RELEASE*はとにかく話を聞いて欲しい人が必ずポジティブな反応をもらえるサービスです。
- 匿名で画像をつけて呟ける
- 投稿を検索できる
- 投稿に対する反応が共感と応援のみなので誰も傷つかない
- 共感数、応援数で並び替えができる
- 自分の投稿数をグラフで可視化できる. [](スペース２つで改行(ピリオドみたいになる))

![投稿一覧画面](https://user-images.githubusercontent.com/84183018/134270154-5fa83cab-8ac3-497f-8d85-60d59208816f.png)

### サイトテーマ
**躊躇わず、飾らず、ありのままを呟けるSNS**

### テーマを選んだ理由
　私は過去にストレスが溜まり、落ち込んでいた時期に知っている人には聞かれたくないことをSNSで呟いたことがあります。
その結果、共感してもらったり、応援されたことで元気が出て明日に臨むことができました。
もし、同じ方法で助けられる人がいるなら**一人で不安や悩みを抱え込んでしまわない**ように、力になりたいと思いこのテーマを選びました。

### ターゲットユーザ
1. ストレスが溜まっている人
1. 相手(聞き手)を気にせずに話したい人
1. 空気を読まずに自分のことだけ話したい人
1. 覚えたことをアウトプットしたい人
1. 不安だったり苦しい時、同じような境遇の人を見つけて安心したい人

### 主な利用シーン
　不安や悩みが無い人でも、目標を決意したり、覚えたことをアウトプットしたい人が誰かに聞かれることでより強く意識できる場としても使ってもらえたらと思っています。
躊躇わず、飾らず、ありのままを呟ける環境を作るために匿名で投稿することができ、他のユーザーの反応を共感と応援に限定しました。
例えば、不安を抱えている人には共感を、目標を立てた人には応援を、落ち込んでいる人には共感と応援の両方を送ることができます。
呟いた人ではなく呟きそのものを見て欲しいという観点から、ユーザー同士が繋がる機能（フォロー機能等）は実装しない見込みです。
自分が思っていること（呟き）を客観的にどう感じるのかノーリスクで簡単に確認することができます。

![使用方法](https://i.gyazo.com/1851dd396d0110c42e3edb8c151ff598.gif)](https://gyazo.com/1851dd396d0110c42e3edb8c151ff598)

## 設計書
- [ER図](https://app.diagrams.net/#G1Jd-rg29Rop9cNNsN64iC1J2JTriy68D8)
- [UI flows](https://app.diagrams.net/#G1VQVFU7tM3FTUSMxdp7zBOeUfknkuH0Ah)
- [ワイヤーフレーム](https://app.diagrams.net/#G1a59JGzHrP5RTJXfoelzIiGPC_p-sotZH)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/103j_yqMhp5Eek5g7XU9HqTWFHqMS3dVDD85aAfrw__4/edit#gid=0)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1dniXNADwXerGMXdk8vQyJR2q5UnP4J4-8zGfhrj3H1c/edit#gid=2133469642)

## チャレンジ要素一覧
[チャレンジ要素一覧及び実装難易度](https://docs.google.com/spreadsheets/d/1CX1yBqZl-60JsZaFbezGSph6PspYy6W37kY8DFFGFJ8/edit#gid=0)

## 開発環境
- OS：Linux(CentOS)
- AWS
  - VPC
  - EC2
  - RDS
- MySQL
- Nginx
- Puma
- 言語
  - HTML
  - CSS
  - JavaScript
  - Ruby 2.6.3
  - SQL
- フレームワーク：Ruby on Rails 5.2.6
- JSライブラリ：jQuery
- IDE：Cloud9
- RSpec

## AWS(インフラ)構成図
[RELEASE_AWS構成図](https://app.diagrams.net/?splash=0&libs=aws4#G1UI5r_LU2kPtf3_8C888t9XMKPJtg0xoq)

## 取り入れた技術
- ユーザー認証(devise)及びメッセージの日本語化
- 新規登録時メール自動配信
- 管理者権限(投稿の削除)
- テキストアニメーション
- 動画背景
- 共感、応援機能の非同期通信(Ajax)
- 通知機能
- ミュート機能(投稿の非表示機能)
- カテゴリー検索
- インクリメンタルサーチ及び非同期の絞り込み機能
- 並び替え(テーブル結合)
- ページネーション
- 画像アップロード機能(Refile)
- 画像拡大(モーダルウィンドウ)
- Google Natural Language API
- Bootstrap
- SCSS
- rubocop
- タブメニュー
- お問い合わせ機能

