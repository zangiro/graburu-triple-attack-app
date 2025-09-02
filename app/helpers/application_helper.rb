module ApplicationHelper
  def page_title(title = "")   # メソッドが呼ばれたときに引数が渡されなかった場合に、デフォルトで空の文字列を使う意味
    @base_title = "グラブルTA計算アプリ"
    title.present? ? "#{title} | #{@base_title}" : @base_title
  end

  def default_meta_tags
    {
      site: "グラブルTA計算アプリ",
      title: "グラブルTA計算アプリ",
      reverse: true,
      charset: "utf-8",
      description: "パーティメンバー全員のTA率を確認しながら編成を組む際に役に立ちます。このアプリは、ブラウザゲーム「グランブルーファンタジー」におけるTA率（トリプルアタック率）の計算を行うアプリです",
      keywords: "グラブル,グランブルーファンタジー,GRANBLUE FANTASY,TA,TA率,計算ツール,計算アプリ,計算,ツール,アプリ,トリプルアタック",
      canonical: "https://graburu-triple-attack-app.com",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://graburu-triple-attack-app.com",
        image: image_url("ogp_1280_720.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary",
        site: "@bfkjs8",
        image: image_url("ogp_1280_720.png")
      }
    }
  end
end
