import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_color.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/font_styles.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_cubit.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_state.dart';
import 'package:meetntrain/meet_n_train_events/presentation/pages/home_sceen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Meet\'N\'Train',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ConditionalBuilder(
                        condition: state is! GetEventsLoadingState,
                        builder: (BuildContext context) {
                          return MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: AppColors.primaryColor,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: Text(
                              'Start',
                              style: getBoldStyle(
                                fontColor: AppColors.white,
                              ),
                            ),
                          );
                        },
                        fallback: (BuildContext context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
