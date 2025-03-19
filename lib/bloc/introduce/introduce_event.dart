part of 'introduce_bloc.dart';

@immutable
sealed class IntroduceEvent {}

final class GetCompanyId extends IntroduceEvent {
  final String code;

  GetCompanyId({required this.code});
}
