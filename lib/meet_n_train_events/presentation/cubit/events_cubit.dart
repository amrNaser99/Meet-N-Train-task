import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetntrain/meet_n_train_events/data/models/event_model.dart';
import 'package:meetntrain/meet_n_train_events/data/repositories/repository.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_state.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
class EventsCubit extends Cubit<EventsState> {
  final Repository repository;

  EventsCubit({
    required this.repository,
  }) : super(EventsInitial());

  static EventsCubit get(context) => BlocProvider.of(context);

  List<EventsModel>? events = [];
  // List? pageNu = [1,2,3,4,5,6,7,8,9,10];
  int pageNum = 1;

  Future getEvents({required int pageNumber, required date}) async {
    emit(GetEventsLoadingState());
    debugPrint('page number : $pageNumber');
    final response = await repository.getEvents(
      pageNumber: pageNumber,
      date: date,
    );
    response.fold(
        (l) => emit(
              ErrorState(exception: l),
            ), (r) {
      events!.addAll(r);


      emit(GetEventsSuccessState(events: events!));
    });
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  int currentIndex = 0;

  void changeItemIndex(int index) {
    debugPrint('pageNum $pageNum');
    currentIndex = index;
    emit(ChangeItemIndexState(index));
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void loadMorePagination() async {
    pageNum++;
    debugPrint('page number : $pageNum');
    getEvents(pageNumber: pageNum, date: DateTime.now().toUtc().toString());
    emit(LoadMorePaginationState());

  }

  Future refreshPagination() async {
    Future.delayed(const Duration(seconds: 2), () {
      loadMorePagination();
      emit(RefreshPaginationState());
    });
  }
}
