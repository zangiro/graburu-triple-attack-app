module ApplicationHelper
  def page_title(title = "")   # メソッドが呼ばれたときに引数が渡されなかった場合に、デフォルトで空の文字列を使う意味
    @base_title = "グラブルTA計算ツール"
    title.present? ? "#{title} | #{@base_title}" : @base_title
  end
end
