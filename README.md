# rails5-api-prototype
Ruby on Rails5で作成したRestAPIのプロトタイプ

* Ruby version
  2.3.1

## 作業の進め方

1. featureブランチを作成。

    ※ブランチ名はfeature + 分かりやすい名前で

1. 作成したfeatureブランチとIssueを紐付ける。

    [こちら](https://github.com/shiro615/futsal_app/issues/2)を参考にさせて頂きました。

    コミット内容にIssueのIDを含めるようにすれば良い。

    ```
    $ git commit --allow-empty -m "resolve #5"
    ```

    "#5"の部分に対象のIssue IDを入れる。

1. プルリクエストを作成する。

1. 確認後、問題がなければマージする。

    もし問題があれば、修正し再度プルリクエストを作成する。
