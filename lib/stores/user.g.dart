// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on UserBase, Store {
  final _$nameAtom = Atom(name: 'UserBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('UserBase.login');

  @override
  Future<bool> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$onAppInitTreatLoginAsyncAction =
      AsyncAction('UserBase.onAppInitTreatLogin');

  @override
  Future<bool> onAppInitTreatLogin() {
    return _$onAppInitTreatLoginAsyncAction
        .run(() => super.onAppInitTreatLogin());
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
