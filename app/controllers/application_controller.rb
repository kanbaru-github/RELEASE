class ApplicationController < ActionController::Base

  # # ロケール振り分けを全てのアクションで実行
  # around_action :switch_locale

  # # params値のロケールによる振り分け
  # def switch_locale(&action)
  #   locale = params[:locale] || I18n.default_locale
  #   I18n.with_locale(locale, &action)
  # end

  # # url_for関係メソッドでロケールを設定するよう上書き
  # def default_url_options
  #   { locale: I18n.locale }
  # end



end
