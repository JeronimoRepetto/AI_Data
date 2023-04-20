part of 'location_section_bloc.dart';

class LocationSectionState extends Equatable {
  final String? location;
  const LocationSectionState({
    this.location,
  });

  @override
  List<Object?> get props => [location];

  LocationSectionState copyWith({
    String? location,
  }) =>
      LocationSectionState(
        location: location ?? this.location,
      );
}
