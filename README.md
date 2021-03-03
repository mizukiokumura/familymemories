# アプリケーション名
  __FamilyMemories__
 
# アプリケーションの概要 

| 導入した機能                              |
| --------------------------------------- |
| ユーザー登録機能                           |
| ４枚まで画像を投稿できる機能                 |
| 30MB以内の動画を投稿できる機能               |
| ajax通信を用いた、コメント投稿機能            |
| 登録したユーザーの情報を編集できる機能         |
| 投稿した思い出(memory)を編集できる機能        |
| 投稿した思い出の検索をすることができる機能      |
| 投稿した思い出の詳細ページをみることができる機能 |
| 投稿した思い出の削除ができる機能              |
# 制作背景
  * 自分の家ではまだアルバムがアナログな状態で残っていて、毎回押し入れから出して、戻してを繰り返し、とても手間が掛かっているなと気づきこのアプリの制作をする事に決めました。
  このアプリを作ることで、家族全員が簡単にコメントを残すことが出来たり、その時の心に残った事や画像、動画を紐付けて管理する事が出来るようになり、一生の思い出としてインターネット上に保存できたら、毎回押し入れから出して戻してを繰り返す必要もなく、写真をプリントする必要もないので便利なのではないかと考えたからです。

  * gif画像 

  * トップページの画像 https://gyazo.com/48eb76dc842ab2cfec2be5ca2ae99deb

  * 思い出作成画像 https://gyazo.com/49c604dd47886c7e81cfc2ba25664d0d

  * 思い出詳細画像 https://gyazo.com/aa5761bdb1cf33e721d61b8aeecaa786

  * コメント投稿画像 https://gyazo.com/ea4ef80f5f5f468f2b646e2bb3626bd6

  * 動画投稿時画像詳細画像 https://gyazo.com/625de6f4b9d751185050aa5fd6834663

# このアプリケーションの使用方法
 * 新規登録ボタンでユーザーを作っていただき、NewMemoryCreateにてタイトルとmemoryと画像を記載いただき、作成するを押していただきますと、思い出を作成する事ができます。
 * トップページもしくはヘッダーバーで投稿を検索していただくと、投稿者であれば、削除や編集が可能です。
 * コメントの投稿はトップページもしくヘッダーバーで投稿を検索していただくと詳細ボタンが有りますのでボタンを押し詳細ページにに遷移していただき、コメント投稿欄にご記載いただくと、投稿者もしくは他のユーザーでも、コメントを投稿する事が可能です。
# URL&テストアカウント 
  * URL https://familymemories-33989.herokuapp.com/
  
  * テストアカウント
  * 1つめのテストアカウント
  email: sample@sample,
  password: wagagunn1
  * 2つめのテストアカウント
  email: hoge@sample,
  password: wagagunn1

# 工夫したポイント
 * コメント投稿機能を非同期通信で行っているのですが、最初はrailsの非同期では無い状態で実装していたのですが、
 全くjavascriptが分からない状態から、jqueryを導入し、コメント投稿機能を調べ、何とか非同期でコメントを投稿する事ができるようになりました。
  
 * ビューファイルやトップページの動画の挿入などは、自分で調べデザインテンプレートを使い、railsの表示の仕方に工夫することで、自分独自のビューファイルに変更する事ができました。
 * 複数枚の画像や動画を投稿できるようにしたかったため、ActiveStorageの使い方を工夫し、バリデーションも自ら調べて工夫しました。


# 課題や今後実装したい機能
 課題や今後実装したい機能は大きく分けて3つあり、ビューファイルと、家族表示機能と、思い出一覧表示機能です。
 * ビューファイルは現状トップページは必要最小限の見た目を整えているに過ぎず、字体や動画にも工夫や改善点が多いなと考えております。思い出作成ページも殺風景で入力欄のみある状態でかつ左に偏っていたり綺麗に形になっているとは言えない状況なので改善していきたい。
 * 家族表示機能とはユーザー登録してある家族の名前（もしくはニックネーム）をトップページで表示できるようにし、その家族の投稿した思い出を閲覧できるようにする事ができる機能を実装したいと考えております。
 * 思い出一覧表示機能は投稿した全ての思い出を表示できるようにする機能で、現状だとアプリの動作を軽くするために３つほどに表示を絞っているため、投稿した機能が全て見れるような機能があったら便利だなと思っています。

# 使用技術
 ## バックエンド
   * Ruby, Ruby on Rails
 ## フロントエンド
  * JavaScript,JQuery,Ajax
 ## ソース管理
  * Github,GitHubDesktop
 ## テスト
  * Rspec
 ## エディタ
  * VScode

# テーブル設計

## usersテーブル

| Column               | Type    | Options       |
| -------------------- | ------- | ------------- |
| nickname             | string  | null: false   |
| email                | string  | null: false   |
| password             | string  | null: false   |
| jp_last_name         | string  | null: false   |
| jp_first_name        | string  | null: false   |
| jp_kana_last_name    | string  | null: false   |
| jp_kana_first_name   | string  | null: false   |
| birthday             | string  | null: false   |
| profile              | text    |               |

### Association

- has_many :memories
- has_many :comments

## memories テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| title       | string     | null: false                     |
| memories    | date       | null: false                     |
| diary       | text       | null: false                     |
| user        | references | null: false,  foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| comment   | string      |                                |
| user      | references  | null: false, foreign_key: true |
| memory    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memory