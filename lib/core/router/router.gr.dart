// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:iotools/presentation/home/home.dart' as _i1;
import 'package:iotools/presentation/introduce/introduce.dart' as _i2;
import 'package:iotools/presentation/login/login.dart' as _i3;
import 'package:iotools/presentation/registration/registration.dart' as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.IntroduceScreen]
class IntroduceRoute extends _i5.PageRouteInfo<void> {
  const IntroduceRoute({List<_i5.PageRouteInfo>? children})
    : super(IntroduceRoute.name, initialChildren: children);

  static const String name = 'IntroduceRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroduceScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i6.Key? key,
    required int companyId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, companyId: companyId),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i3.LoginScreen(key: args.key, companyId: args.companyId);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.companyId});

  final _i6.Key? key;

  final int companyId;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, companyId: $companyId}';
  }
}

/// generated route for
/// [_i4.RegistrationScreen]
class RegistrationRoute extends _i5.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i6.Key? key,
    required int companyId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         RegistrationRoute.name,
         args: RegistrationRouteArgs(key: key, companyId: companyId),
         initialChildren: children,
       );

  static const String name = 'RegistrationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegistrationRouteArgs>();
      return _i4.RegistrationScreen(key: args.key, companyId: args.companyId);
    },
  );
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key, required this.companyId});

  final _i6.Key? key;

  final int companyId;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, companyId: $companyId}';
  }
}
