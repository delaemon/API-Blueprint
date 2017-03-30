FORMAT: 1A
# メッセージ
## メッセージのAPIエンドポイント [/v2/messages]
### メッセージ登録 [POST]
#### 概要
* メッセージ情報を新規登録
* 登録に成功した場合、message_idを返す
+ Request (application/json)
    + Headers

            Accept: application/json

    + Attributes

        + from: from@example.com (string, required) - 送信者メールアドレス(format: email)
        + to: to@example.com (string, required) - 受信者メールアドレス(format: email)
        + body: Hello (string, required) - メッセージ本文

+ Response 201 (application/json)

    + Attributes
        + message_id: 1 (number)

## メッセージ情報取得 [/v2/messages/{message_id}]
### メッセージ情報取得API [GET]
#### 概要
* 指定したメッセージ情報を返す。
* message_id必須。指定がない場合、BadRequestを返す。

+ Parameters

    + message_id: 1 (number, required) - ユーザID

+ Response 200 (application/json)

    + Attributes

        + from: from@example.com (string, required) - 送信者メールアドレス(format: email)
        + to: to@example.com (string, required) - 受信者メールアドレス(format: email)
        + body: Hello (string, required) - メッセージ本文


+ Response 404 (application/json)

    + Attributes
        + error_code: not found user(string, required)

