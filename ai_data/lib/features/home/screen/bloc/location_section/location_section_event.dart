part of 'location_section_bloc.dart';

abstract class LocationSectionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnSetLocation extends LocationSectionEvent {
  final String location;
  OnSetLocation(this.location);
}
