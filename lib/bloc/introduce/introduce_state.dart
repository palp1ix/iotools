part of 'introduce_bloc.dart';

@immutable
sealed class IntroduceState {}

final class IntroduceInitial extends IntroduceState {}

final class IntroduceLoading extends IntroduceState {}

final class IntroduceSuccess extends IntroduceState {
  final int companyId;

  IntroduceSuccess({required this.companyId});
}

final class IntroduceError extends IntroduceState {}
