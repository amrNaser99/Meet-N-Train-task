import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../core/utiles/app_spaces.dart';
import '../../data/models/event_model.dart';
import 'evevts_card_items.dart';

class EventBuilder extends StatefulWidget {
  final List<EventsModel> events;

  const EventBuilder({Key? key, required this.events}) : super(key: key);

  @override
  State<EventBuilder> createState() => _EventBuilderState();
}

class _EventBuilderState extends State<EventBuilder> {
  @override
  void initState() {
    super.initState();
    EventsCubit cubit = EventsCubit.get(context);

    /// fetch events item that now in the top
    cubit.itemPositionsListener.itemPositions.addListener(() {
      if (cubit.itemPositionsListener.itemPositions.value.first.index !=
          cubit.currentIndex && cubit.events![cubit.itemPositionsListener.itemPositions.value.first.index].date != cubit.events![cubit.currentIndex].date!) {
        /// share the index of item to get date in the upper row
        cubit.changeItemIndex(
          cubit.itemPositionsListener.itemPositions.value.first.index,
        );
      }
      /// make pagination if the user scroll to the end of the list
      if (cubit.itemPositionsListener.itemPositions.value.last.index ==
          cubit.events!.length - 1) {
        debugPrint(
            'last index : ${cubit.itemPositionsListener.itemPositions.value.last.index}');
        cubit.pageNum < 3 ? cubit.loadMorePagination() : null;
        debugPrint('load more pagination');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    EventsCubit cubit = EventsCubit.get(context);
    return ConditionalBuilder(
      condition: widget.events.isNotEmpty,
      builder: (context) => RefreshIndicator(
        backgroundColor: Colors.white,
        onRefresh: () async {
          cubit.refreshPagination();
        },
        child: ScrollablePositionedList.separated(
          itemPositionsListener: cubit.itemPositionsListener,
          itemScrollController: cubit.itemScrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return EventsCard(
              event: cubit.events![index],
            );
          },
          separatorBuilder: (context, index) => AppSpaces.vSpace20,
          itemCount: cubit.events!.length,
        ),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
