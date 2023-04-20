import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_section_event.dart';
part 'location_section_state.dart';

class LocationSectionBloc
    extends Bloc<LocationSectionEvent, LocationSectionState> {
  LocationSectionBloc() : super(const LocationSectionState()) {
    on<OnSetLocation>(
      (event, emit) => emit(
        state.copyWith(
          location: event.location,
        ),
      ),
    );
  }

  void setLocation(String? location) {
    if (location == null || location.isEmpty) return;
    add(OnSetLocation(location));
  }
}
