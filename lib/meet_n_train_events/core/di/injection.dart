import 'package:get_it/get_it.dart';
import 'package:meetntrain/meet_n_train_events/data/repositories/repository.dart';
import 'package:meetntrain/meet_n_train_events/domain/repositories/repository_impl.dart';
import 'package:meetntrain/meet_n_train_events/presentation/cubit/events_cubit.dart';
import 'package:meetntrain/meet_n_train_events/services/api_service/dio_helper.dart';
import 'package:meetntrain/meet_n_train_events/services/api_service/dio_impl.dart';

final sl = GetIt.instance;

Future<void> diInit() async {
  sl.registerFactory(() => EventsCubit(repository: sl()));

  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<Repository>(
    () => RepositoryImplementation(
      dioHelper: sl(),
    ),
  );
}
