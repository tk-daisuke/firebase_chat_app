# firebase_template_app
下記パッケージ等をためしています。

https://pub.dev/packages/flutterfire_ui/example

firestore設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vTVyDawj0QGqG1WpDmHx0Cj4mahh_feS9_mchwz6hu1xG-7dZUzk64iNqxGW3jTQqSE3le2L88BnUep/pubhtml

# Getting Started

### 必要なファイル Firebaseの初期設定で入手可 KEYが含まれるためアップロード不可
- https://firebase.google.com/docs/flutter/setup?hl=ja&platform=ios
- `google-services.json`
- `GoogleService-Info.plist`

AndroidBundleID
com.example.firebase_template_app

AppleBundleID
com.example.firebaseTemplateApp


### GoogleSignIn用
- ios

`firebase_template_app/ios/Runner/Info bak.plist`を「Info.plist」にリネーム
下記のリンク内のiOS integration を追加

https://pub.dev/packages/google_sign_in

--lib/data/keys.dart
const kFirebaseIosAppID =   ;

GoogleService-Info.plist内のREVERSED_CLIENT_IDを上記パスへ記入


- Android
下記のリンクを参照

https://pub.dev/packages/google_sign_in

--lib/data/keys.dart
const kFirebaseAndroidAppID = ;

google-services.json内の  "oauth_client" →"client_id"を上記パスへ記入

# Firebaseの設定
### Firebase Auth
### ログイン プロバイダ 下記を有効化
- メールパスワード
- Google
- 匿名 
### Cloud Firestore
利用の開始

