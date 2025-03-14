import 'package:equatable/equatable.dart';

abstract class NasaEvent extends Equatable {
  const NasaEvent();
  @override
  List<Object> get props => [];
}

class NasaEventFetch extends NasaEvent {}

class NasaEventReset extends NasaEvent {}
