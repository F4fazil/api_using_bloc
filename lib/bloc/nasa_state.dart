import 'package:equatable/equatable.dart';

abstract class NasaState extends Equatable {
  const NasaState();
  @override
  List<Object> get props => [];
}

class NasaStateInitial extends NasaState {}

class NasaStateLoading extends NasaState {}

class NasaStateSuccess extends NasaState {
  final String url;
  const NasaStateSuccess({required this.url});
  @override
  List<Object> get props => [url];
}

class NasaStateError extends NasaState {
  final String message;
  const NasaStateError({required this.message});
  @override
  List<Object> get props => [message];
}

class NasaStateReset extends NasaState {}
