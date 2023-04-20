import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_package/blocs/blocs.dart';
import 'package:map_package/screens/gps_access_sceen.dart';
import 'package:map_package/screens/map_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
        return state.isAllGranted ? const MapScreen() : const GpsAccessScreen();
      }),
    );
  }
}
