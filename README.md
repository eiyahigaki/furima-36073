# アプリケーション名
amatsu

# アプリケーション概要
amatsuとは、派遣業界に特化した求人SNSである。<br>
既存のアプリケーションと比較した独自性は以下の2点である。<br><br>

1. 派遣業界に特化していること。<br>
2. 求人サイトではなく、求人SNSであること。<br><br>

これらの特徴によって、派遣会社の費用を最小限に抑え、<br>売上を最大化することを目的とする。

# URL
https://amatsu-36073.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード: admin<br>
- Basic認証ID: 2222<br>
- メールアドレス: test@example<br>
- パスワード: a1a1a1

# 利用方法
## 案件投稿
1. トップページ(一覧ページ)のヘッダーからログインする。<br>
2. 新規案件出稿ボタンから、案件の内容を入力し出稿する。<br>
3. 一覧画面に戻るので、投稿した案件の『詳しく見る』から確認する。

## フォローする
1. coming soon<br>
2. coming soon<br>
3. coming soon

# アプリケーションを作成した背景
前職でのDX商材のカスタマーサクセス経験によって、派遣会社が超薄利多売モデルであることを認知することになった。<br>この課題を分析した結果、案件登録〜派遣登録〜マッチングの流れに改善の余地があることが判明した。<br>この課題は、派遣法の改正によって、むしろ悪化の一途を辿っている最中であり、この課題を解決するアプリケーションが未だ存在しないことから、派遣業界に特化した求人SNSを開発することで解決を試みる。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1rI2AjzlPVocomCXgNSn8W8DUu0PODu0c6WO_NBfAkL4/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明
一覧画面[![Image from Gyazo](https://i.gyazo.com/38381e92ce5e70ed76a5bf3eaa9799ad.png)](https://gyazo.com/38381e92ce5e70ed76a5bf3eaa9799ad)

# 実装予定の機能
現在は、案件出稿機能を実装中。今後は以下の段階を予定。<br>
- 求職者管理の実装<br>
- Client管理の実装<br>
- コメント管理<br>
- フォロー管理<br>
- リクエスト管理

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/2951ad6d09137f7627c14709195db9e5.png)](https://gyazo.com/2951ad6d09137f7627c14709195db9e5)
(随時更新中)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/7a97aaf6cfeef87133714df9d4af1a54.png)](https://gyazo.com/7a97aaf6cfeef87133714df9d4af1a54)
(随時更新中)
# 開発環境
- フロントエンド:HTML/CSS<br>
- バックエンド:Ruby/Ruby on Rails<br>
- インフラ:Heroku/AWS<br>
- テスト:<br>
- テキストエディタ:Visual Studio Code<br>
- タスク管理:Github

# ローカルでの動作方法
以下のコマンドを順に実行。<br>
`git clone https://github.com/eiyahigaki/amatsu.git`<br>
`cd amatsu`<br>
`bundle install`<br>
`yarn install`

# 工夫したポイント
詳しくは[オリアプのプレゼンテーション](https://docs.google.com/presentation/d/1myF5QOogP9evBlYyuAzwf6aN-OH1HDkWv_YXzqqmgr8/edit?usp=sharing)まで(随時、更新中)
1. 課題の重要性を確認。<br>
    - 課題は、一般社団法人 日本人材派遣協会が公開しているデータを元に提起。<br>
    - なおかつ重要性が高いことを警鐘。<br>
2. 課題の深掘りを実施。<br>
    - 「派遣会社諸経費」を紐解くために、派遣の仕組みを整理。<br>
    - amatsuが解決する、煩雑な仕組みを明確にする。<br>
    - 「派遣業界に特化」「求人SNS」この2つのアイデアを元に解決を模索。<br>
3. オリアプには随時新しい知識をインプットして実装中。
    - HTML/CSSには、Bootstrap/Bootstrap Iconを活用。
    - フォロー機能には、Vue.js/Reactを検討中。




# テーブル設計

## usersテーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|en_family         |string|null: false              |
|en_first          |string|null: false              |
|kana_family       |string|null: false              |
|kana_first        |string|null: false              |
|birth             |date  |null: false              |

### Association

- has_many :items
- has_many :histories

## itemsテーブル

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|title      |string    |null: false                   |
|detail     |text      |null: false                   |
|category_id|integer   |null: false                   |
|state_id   |integer   |null: false                   |
|charge_id  |integer   |null: false                   |
|area_id    |integer   |null: false                   |
|term_id    |integer   |null: false                   |
|price      |integer   |null: false                   |
|user       |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :history

## historiesテーブル

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|postal_code|string    |null: false                   |
|area_id    |integer   |null: false                   |
|city       |string    |null: false                   |
|address    |string    |null: false                   |
|building   |string    |                              |
|tel        |string    |null: false                   |
|history    |references|null: false, foreign_key: true|

### Association

- belongs_to :history
