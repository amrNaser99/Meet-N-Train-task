import 'package:dartz/dartz.dart';
import 'package:meetntrain/meet_n_train_events/core/error/exceptions.dart';
import 'package:meetntrain/meet_n_train_events/core/utiles/app_contstants.dart';
import 'package:meetntrain/meet_n_train_events/data/models/event_model.dart';
import 'package:meetntrain/meet_n_train_events/data/repositories/repository.dart';
import 'package:meetntrain/meet_n_train_events/services/api_service/dio_helper.dart';
import 'package:meetntrain/meet_n_train_events/services/api_service/end_points.dart';

class RepositoryImplementation extends Repository {
  final DioHelper dioHelper;

  RepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<PrimaryServerException, List<EventsModel>>> getEvents({
    required int pageNumber,
    required String date,
  }) {
    return handlingRequestResult(
      onSuccess: () async {
        final response = await dioHelper.get(
          endPoint: '$API_VERSION$upcommingEventsEndPoint${AppConst.userId}',
          query: {
            'page': pageNumber,
            'date_gte': date,
          },
          token: AppConst.token,
        );
        List<EventsModel>? events =
            (response as List).map((e) => EventsModel.fromJson(e)).toList();
        return events;
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}
