import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meetntrain/meet_n_train_events/bloc_observer.dart';
import 'package:meetntrain/meet_n_train_events/core/di/injection.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_contstants.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_themes.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_cubit.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_state.dart';
import 'package:meetntrain/meet_n_train_events/presentation/pages/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  diInit();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsCubit>(
      create: (context) => sl<EventsCubit>(),

      child: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                title: AppConst.appName,
                debugShowCheckedModeBanner: false,
                theme: AppThemes.lightTheme,
                home: child,
              );
            },
            child: const StartScreen(),
          );
        },
      ),
    );
  }
}
