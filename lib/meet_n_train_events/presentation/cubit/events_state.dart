import 'package:meetntrain/meet_n_train_events/core/error/exceptions.dart';

abstract class EventsState {}

class EventsInitial extends EventsState {}

class GetEventsLoadingState extends EventsState {}
class GetEventsSuccessState extends EventsState {}

class ErrorState extends EventsState {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}

class ChangeItemIndexState extends EventsState {
  final int index ;

  ChangeItemIndexState(this.index);
}
