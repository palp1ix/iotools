// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:iotools/data/model/detector/detector.dart' as _i11;
import 'package:iotools/presentation/add_new_room/add_new_room.dart' as _i1;
import 'package:iotools/presentation/detector_screen/detector_screen.dart'
    as _i2;
import 'package:iotools/presentation/home/home.dart' as _i3;
import 'package:iotools/presentation/introduce/introduce.dart' as _i4;
import 'package:iotools/presentation/login/login.dart' as _i5;
import 'package:iotools/presentation/notification_screen/notification_screen.dart'
    as _i8;
import 'package:iotools/presentation/registration/registration.dart' as _i6;
import 'package:iotools/presentation/rooms/rooms.dart' as _i7;

/// generated route for
/// [_i1.AddRoomScreen]
class AddRoomRoute extends _i9.PageRouteInfo<void> {
  const AddRoomRoute({List<_i9.PageRouteInfo>? children})
    : super(AddRoomRoute.name, initialChildren: children);

  static const String name = 'AddRoomRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddRoomScreen();
    },
  );
}

/// generated route for
/// [_i2.DetectorScreen]
class DetectorRoute extends _i9.PageRouteInfo<DetectorRouteArgs> {
  DetectorRoute({
    _i10.Key? key,
    required _i11.Detector detector,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         DetectorRoute.name,
         args: DetectorRouteArgs(key: key, detector: detector),
         initialChildren: children,
       );

  static const String name = 'DetectorRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetectorRouteArgs>();
      return _i2.DetectorScreen(key: args.key, detector: args.detector);
    },
  );
}

class DetectorRouteArgs {
  const DetectorRouteArgs({this.key, required this.detector});

  final _i10.Key? key;

  final _i11.Detector detector;

  @override
  String toString() {
    return 'DetectorRouteArgs{key: $key, detector: $detector}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.IntroduceScreen]
class IntroduceRoute extends _i9.PageRouteInfo<void> {
  const IntroduceRoute({List<_i9.PageRouteInfo>? children})
    : super(IntroduceRoute.name, initialChildren: children);

  static const String name = 'IntroduceRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.IntroduceScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    required int companyId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, companyId: companyId),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i5.LoginScreen(key: args.key, companyId: args.companyId);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.companyId});

  final _i10.Key? key;

  final int companyId;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, companyId: $companyId}';
  }
}

/// generated route for
/// [_i6.RegistrationScreen]
class RegistrationRoute extends _i9.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i10.Key? key,
    required int companyId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         RegistrationRoute.name,
         args: RegistrationRouteArgs(key: key, companyId: companyId),
         initialChildren: children,
       );

  static const String name = 'RegistrationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegistrationRouteArgs>();
      return _i6.RegistrationScreen(key: args.key, companyId: args.companyId);
    },
  );
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key, required this.companyId});

  final _i10.Key? key;

  final int companyId;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, companyId: $companyId}';
  }
}

/// generated route for
/// [_i7.RoomsScreen]
class RoomsRoute extends _i9.PageRouteInfo<void> {
  const RoomsRoute({List<_i9.PageRouteInfo>? children})
    : super(RoomsRoute.name, initialChildren: children);

  static const String name = 'RoomsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.RoomsScreen();
    },
  );
}

/// generated route for
/// [_i8.SensorAlertScreen]
class SensorAlertRoute extends _i9.PageRouteInfo<void> {
  const SensorAlertRoute({List<_i9.PageRouteInfo>? children})
    : super(SensorAlertRoute.name, initialChildren: children);

  static const String name = 'SensorAlertRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i8.SensorAlertScreen();
    },
  );
}
