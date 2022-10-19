import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_color.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_spaces.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_values.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/font_styles.dart';
import 'package:meetntrain/meet_n_train_events/presentation/widgets/event_builder.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_cubit.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_state.dart';
import 'package:meetntrain/meet_n_train_events/presentation/widgets/evevts_card_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsState>(
      listener: (context, state) {},
      builder: (context, state) {
        EventsCubit cubit = EventsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Schedule'),
          ),
          body: Column(
            children: [
              Container(
                height: AppHeight.h50,
                padding: EdgeInsets.symmetric(horizontal: AppHeight.h10),
                child: Row(
                  children: [
                    Container(
                      width: AppWidth.w50,
                      height: AppHeight.h40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Icon(
                        Icons.calendar_today_outlined,
                        size: 25,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    AppSpaces.hSpace10,
                    Row(
                      children: [
                        Text(
                          DateFormat.d().format(
                            DateTime.parse(
                                cubit.events![cubit.currentIndex].date!),
                          ),
                          style: getBoldStyle(
                            fontColor: AppColors.black,
                            fontSize: AppSize.s40,
                          ),
                        ),
                        AppSpaces.hSpace5,
                        Column(
                          children: [
                            Text(
                              DateFormat.yMMMMEEEEd()
                                  .format(
                                    DateTime.parse(cubit
                                        .events![cubit.currentIndex].date!),
                                  )
                                  .split(',')[0],
                              style: getBoldStyle(
                                fontColor: AppColors.grey,
                                fontSize: AppSize.s16,
                              ),
                            ),
                            Text(
                              DateFormat.yMMM().format(
                                DateTime.parse(
                                    cubit.events![cubit.currentIndex].date!),
                              ),
                              style: getBoldStyle(
                                fontColor: AppColors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: EventBuilder(
                  events: EventsCubit.get(context).events!,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
