part of 'get_data_cubit.dart';

@immutable
sealed class GetDataState {}

final class GetDataInitial extends GetDataState {}
final class LoadingState extends GetDataState{}
final class SuccessState extends GetDataState{
  final List<dynamic> users;
  SuccessState(this.users);
}
final class FailureState extends GetDataState{
  final String errMessage;
  FailureState(this.errMessage);
}
