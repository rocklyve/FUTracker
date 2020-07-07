import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    // here the userauthentication should be done
    print('authenticate');
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    print("delete token");
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    print("persist token");
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    print("has token");
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
