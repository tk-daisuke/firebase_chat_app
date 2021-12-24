import 'package:flutter/material.dart';

class ErrorService {
  String errorMessageSnackBar(String errorText, BuildContext context) {
    final snackBar = SnackBar(content: Text(errorText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return errorText;
  }

  String firebaseAuthErrorLocalize(String e) {
    String _error = '';
    switch (e) {
      case 'requires-recent-login':
        _error = 'この操作をするには再認証が必要です';
        break;
      case 'missing-email':
        _error = 'メールアドレスに問題があります';
        break;
      case 'email-already-in-use':
        _error = 'そのメールアドレスは既に存在します';
        break;
      // case 'weak-password':
      //   infoText = '脆弱なパスワードです';
      //   break;
      case 'sign_in_canceled':
        _error = 'キャンセルしました';
        break;
      case 'error-invalid-email':
        _error = 'メールアドレスの形式が間違っています';
        break;

      case 'user-not-found':
        _error = 'そのアカウントは存在しません';
        break;
      case 'network-request-failed':
        _error = '接続が切れました';
        break;
      case 'too-many-requests': //異常なアクティビティが原因
        _error = '接続エラー';
        break;
      case 'credential-already-in-use':
        _error = 'この資格情報は、すでに別のユーザーアカウントに関連付けられています。';
        break;
    }
    return _error;
  }
}
