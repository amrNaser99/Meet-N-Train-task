import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetntrain/meet_n_train_events/data/models/event_model.dart';
import 'package:meetntrain/meet_n_train_events/data/repositories/repository.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_state.dart';
import 'package:meetntrain/meet_n_train_events/services/api_service/end_points.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class EventsCubit extends Cubit<EventsState> {
  final Repository repository;

  EventsCubit({
    required this.repository,
  }) : super(EventsInitial());

  static EventsCubit get(context) => BlocProvider.of(context);

  List<EventsModel>? events;

  void getEvents({required int pageNumber, required date}) async {
    emit(GetEventsLoadingState());
    final response = await repository.getEvents(
      pageNumber: pageNumber,
      date: date,
    );
    response.fold(
        (l) => emit(
              ErrorState(exception: l),
            ), (r) {
      events = r;
      debugPrint(BASE_IMAGE+events![0].images![0].imageUrl!);

      debugPrint('====== : ${events![0].users!.length}');

      emit(GetEventsSuccessState());
    });
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  int currentIndex = 0 ;
  void changeItemIndex(int index){
    currentIndex = index ;
    emit(ChangeItemIndexState(index));
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

}
