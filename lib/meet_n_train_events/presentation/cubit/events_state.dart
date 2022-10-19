import 'package:meetntrain/meet_n_train_events/core/error/exceptions.dart';

import '../../data/models/event_model.dart';

abstract class EventsState {}

class EventsInitial extends EventsState {}

class GetEventsLoadingState extends EventsState {}

class GetEventsSuccessState extends EventsState {
  final List<EventsModel> events;

  GetEventsSuccessState({required this.events});
}

class ErrorState extends EventsState {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}

class ChangeItemIndexState extends EventsState {
  final int index;

  ChangeItemIndexState(this.index);
}

class LoadMorePaginationState extends EventsState {}
class RefreshPaginationState extends EventsState {}
