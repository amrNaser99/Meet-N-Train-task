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
    EventsCubit.get(context)
        .itemPositionsListener
        .itemPositions
        .addListener(() {
      EventsCubit.get(context).changeItemIndex(EventsCubit.get(context)
          .itemPositionsListener
          .itemPositions
          .value
          .first
          .index);
      debugPrint(
          'index : ${EventsCubit.get(context).itemPositionsListener.itemPositions.value.first.index}');
    });
  }

  @override
  Widget build(BuildContext context) {
    EventsCubit cubit = EventsCubit.get(context);
    return ConditionalBuilder(
      condition: widget.events.isNotEmpty,
      builder: (context) => ScrollablePositionedList.separated(
        itemPositionsListener: cubit.itemPositionsListener,
        itemScrollController: cubit.itemScrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return EventsCard(
            event: widget.events[index],
          );
        },
        separatorBuilder: (context, index) => AppSpaces.vSpace20,
        itemCount: 8,
        // events.length,
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
