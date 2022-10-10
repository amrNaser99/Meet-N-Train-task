import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_values.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/font_styles.dart';
import 'package:meetntrain/meet_n_train_events/data/models/event_model.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_cubit.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_state.dart';
import '../../core/utiles/app_color.dart';
import '../../core/utiles/app_spaces.dart';
import '../../services/api_service/end_points.dart';

class EventsCard extends StatelessWidget {
  final EventsModel event;

  const EventsCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.d().format(
                        DateTime.parse(event.date!),
                      ),
                      style: getBoldStyle(
                          fontColor: AppColors.white, fontSize: AppSize.s12),
                    ),
                    Text(
                        DateFormat.yMEd()
                            .format(
                          DateTime.parse(event.date!),
                        )
                            .split(',')[0],
                      style: getBoldStyle(
                          fontColor: AppColors.white, fontSize: AppSize.s10),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                child: Image.network(
                                  BASE_IMAGE + event.images![0].imageUrl!,
                                  // 'https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              PositionedDirectional(
                                start: 10,
                                top: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.softGrey,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        child: Text(event.tag!.icon!),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        event.tag!.title!.toString(),
                                        style: getBoldStyle(
                                          fontColor: Colors.black,
                                          fontSize: AppSize.s12,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                start: AppSize.s10,
                                bottom: AppSize.s10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.softGrey,
                                  ),
                                  padding: EdgeInsets.all(
                                    AppSize.s6,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        event.spots == 0
                                            ? 'Unlimited Spots'
                                            : '${event.spots} spots left',
                                        style: getSemiBoldStyle(
                                            fontColor: Colors.redAccent,
                                            fontSize: AppSize.s12),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSize.s2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${DateFormat.yMMMEd().format(
                                          DateTime.parse(event.date!),
                                        )} * ${DateFormat.jm().format(
                                          DateTime.parse(event.date!),
                                        )}',
                                        style: getRegularStyle(
                                          fontColor: AppColors.secondGrey,
                                          fontSize: AppSize.s10,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        event.title!,
                                        style: getLightStyle(
                                          fontColor: AppColors.black,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        event.placeName!.split('s')[0],
                                        style: getLightStyle(
                                          fontColor: AppColors.secondGrey,
                                          fontSize: AppSize.s10,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      //Find the number of days between two dates
                                      Text(
                                        '${EventsCubit.get(context).daysBetween(
                                          DateTime.now(),
                                          DateTime.parse(event.finish_date!),
                                        )} days left',
                                        style: getLightStyle(
                                          fontColor: AppColors.primaryColor,
                                          fontSize: AppSize.s10,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      AppSpaces.vSpace10,
                                      Stack(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.softGrey,
                                            ),
                                            child: CircleAvatar(
                                              radius: 12,
                                              child: Image.network(
                                                  BASE_IMAGE +
                                                      event.users![0]
                                                          .profilePicture!),
                                            ),
                                          ),
                                          //   PositionedDirectional(
                                          //   start: 20,
                                          //   child: Container(
                                          //     clipBehavior: Clip
                                          //         .antiAliasWithSaveLayer,
                                          //     decoration: BoxDecoration(
                                          //       borderRadius:
                                          //       BorderRadius.circular(
                                          //           20),
                                          //       color: Colors.white,
                                          //     ),
                                          //     child: CircleAvatar(
                                          //       radius: 12,
                                          //       child: Image.network(
                                          //         BASE_IMAGE +
                                          //             event.users![index]
                                          //                 .profilePicture!,
                                          //         fit: BoxFit.cover,
                                          //       ),
                                          //     ),
                                          //   ) ,
                                          // ) ,
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        size: AppSize.s20,
                                        color: AppColors.primaryColor,
                                      ),
                                      Text(
                                        event.price == 0
                                            ? 'Free'
                                            : '${event.price} AED',
                                        style: getBoldStyle(
                                          fontColor: AppColors.primaryColor,
                                          fontSize: AppSize.s20,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
