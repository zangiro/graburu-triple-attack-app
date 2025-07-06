module ApplicationHelper
  def page_title(title = "")   # メソッドが呼ばれたときに引数が渡されなかった場合に、デフォルトで空の文字列を使う意味
    @base_title = "グラブルTA計算ツール"
    title.present? ? "#{title} | #{@base_title}" : @base_title
  end

  def default_meta_tags
    {
      site: "グラブルTA計算ツール",
      title: "画像でおいしそうなグルメ情報の発掘をサポートするアプリ",
      reverse: true,
      charset: "utf-8",
      description: "パーティメンバー全員のTA率を確認しながら編成を組む際に役に立ちます。このツールは、ブラウザゲーム「グランブルーファンタジー」におけるトリプルアタックの計算を行うツールです",
      keywords: "グラブル,グランブルーファンタジー,GRANBLUE FANTASY,TA,TA率,計算ツール,計算アプリ,計算,ツール,トリプルアタック",
      canonical: "https://myapp-old-hill-1313.fly.dev",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://myapp-old-hill-1313.fly.dev",
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
