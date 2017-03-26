FORMAT: 1A
# ユーザー
## ユーザーのAPIエンドポイント [/v1/users]
### ユーザー登録 [POST]
#### 概要
* ユーザー情報を新規登録
* 登録に成功した場合、user_idを返す
+ Request (application/json)
    + Headers

            Accept: application/json

    + Attributes

        + email: test@example.com (string, required) - メールアドレス(format: email)
        + password: abc123 (string, required) - パスワード(pattern: ^[0-9A-Za-z]{6,16}$)

+ Response 201 (application/json)

    + Attributes
        + user_id: 1 (number)

## ユーザ情報取得 [/v1/users/{user_id}/{?pii,master}]
### ユーザ情報取得API [GET]
#### 概要
* 指定したユーザーの情報を返す。
* user_id必須。指定がない場合、BadRequestを返す。

+ Parameters

    + user_id: 1 (number, required) - ユーザID
    + pii: false (bool, optional) - ユーザのメールアドレス
    + master: false (bool, optional) - マスターDB参照

+ Response 200 (application/json)

    + Attributes
        + user (required)
            + name: wada (string, required)
            + age: 18 (number, required)
            + state: 0 (enum, required) - ユーザ種別(0:仮登録, 1:登録完了)
                + 0 (number)
                + 1 (number)
            + profile (object, required) -- (8)
            + registered: `2017-03-24T01:23:45Z` (string, required)  -- (9)
        + loginHistory (array) -- (11)
            + (object)
                + login_ts: `2017-03-24T01:23:45Z` (string, required)
                + user_agent: `Mozilla/5.0 (PlayStation 4 1.52) AppleWebKit/536.26 (KHTML, like Gecko)` (string, optional)