import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meetntrain/meet_n_train_events/core/error/exceptions.dart';
import 'package:meetntrain/meet_n_train_events/data/models/event_model.dart';

abstract class Repository {
  ///Implement All Events Data Here
  Future<Either<PrimaryServerException, List<EventsModel>>> getEvents({
    required int pageNumber,
    required String date,
  });
}

extension HandlingRequestResultFunction on Repository {
  Future<Either<PrimaryServerException, T>> handlingRequestResult<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e, s) {
      debugPrint(s.toString());
      return Left(e);
    }
  }
}
