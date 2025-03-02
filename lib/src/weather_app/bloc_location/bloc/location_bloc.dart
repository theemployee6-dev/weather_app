import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/determine_position.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<FetchLocation>(_onFetchLocation);
  }

  Future<void> _onFetchLocation(
      FetchLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());

    try {
      //obtem a posição atual
      final Position position =
          await DeterminePosition.determinePositionMethod();

      emit(LocationSuccess(position));
    } catch (e) {
      emit(LocationFailure(e.toString()));
    }
  }
}
